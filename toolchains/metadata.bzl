# yq .ghcupDownloads ~/.ghcup/cache/ghcup-0.0.9.yaml -o json | sed 's/null/None' > metadata.bzl

metadata = {
    "GHC": {
        "7.10.3": {
            "viTags": [
                "base-4.8.2.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/7.10.3/docs/html/users_guide/release-7-10-1.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-src.tar.xz",
                "dlSubdir": "ghc-7.10.3",
                "dlHash": "cf90cedce1c28fd0e2b9e72fe8a938756668d18ea1fcc884a19f698658ac4fef",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/7.10.3/ghc-7.10.3-testsuite.tar.xz",
                "dlSubdir": "ghc-7.10.3/testsuite",
                "dlHash": "50c151695c8099901334a8478713ee3bb895a90132e2b75d1493961eb8ec643a",
            },
            "viPostInstall": "GHC-7.10.3 may give linking errors on most modern distros. You may have to pass '--ghc-option=-optc-no-pie --ghc-option=-optl-no-pie' to cabal build/install. Also see https://gitlab.haskell.org/ghc/ghc/-/issues/18763",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "01cfbad8dff1e8b34a5fdca8caeaf843b56e36af919e29cd68870d2588563db5",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "01cfbad8dff1e8b34a5fdca8caeaf843b56e36af919e29cd68870d2588563db5",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "01cfbad8dff1e8b34a5fdca8caeaf843b56e36af919e29cd68870d2588563db5",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-centos67-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "a8957f7a2fd81720c5d3dc403571d77d31115ff5f42edb2917c36d8e714220d4",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-centos67-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "a8957f7a2fd81720c5d3dc403571d77d31115ff5f42edb2917c36d8e714220d4",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "01cfbad8dff1e8b34a5fdca8caeaf843b56e36af919e29cd68870d2588563db5",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-apple-darwin.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "80893e367e8318105f7db2064adf202e3d96b1f014e792b73e92f2cacf0b757a",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-portbld-freebsd.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "2aa396edd2bb651f4bc7eef7a396913ea24923de5aafdc76df6295333e487e48",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "63e1689fc9e2809ae4d7f422b4dc810052e54c9aa2afd08746e234180e711dde",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "d2ccf072457fb100503f6f5430a1e3589ca525a97424263d036b0550bc277f0c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "d2ccf072457fb100503f6f5430a1e3589ca525a97424263d036b0550bc277f0c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "d2ccf072457fb100503f6f5430a1e3589ca525a97424263d036b0550bc277f0c",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-centos67-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "c50aa20275e8d1ba9148f380eb7598bc148143281fc17c9acd38ea7b325852bd",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-centos67-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "c50aa20275e8d1ba9148f380eb7598bc148143281fc17c9acd38ea7b325852bd",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-deb8-linux.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "d2ccf072457fb100503f6f5430a1e3589ca525a97424263d036b0550bc277f0c",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-portbld-freebsd.tar.bz2",
                            "dlSubdir": "ghc-7.10.3",
                            "dlHash": "3dde05577c6f94dcb0ba201ebd53ab88553bbc9a3aa8e72237162ed7a9d588a3",
                        },
                    },
                },
            },
        },
        "8.0.2": {
            "viTags": [
                "base-4.9.1.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.0.2/docs/html/users_guide/8.0.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-src.tar.xz",
                "dlSubdir": "ghc-8.0.2",
                "dlHash": "11625453e1d0686b3fa6739988f70ecac836cadc30b9f0c8b49ef9091d6118b1",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.0.2/ghc-8.0.2-testsuite.tar.xz",
                "dlSubdir": "ghc-8.0.2/testsuite",
                "dlHash": "52235d299eb56292f2c273dc490792788b8ba11f4dc600035d050c8a4c1f4cf2",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-deb7-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "b2f5c304b57ac5840a0d2ef763a3c6fa858c70840f749cfad12ed227da973c0a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "5ee68290db00ca0b79d57bc3a5bdce470de9ce9da0b098a7ce6c504605856c8f",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "5ee68290db00ca0b79d57bc3a5bdce470de9ce9da0b098a7ce6c504605856c8f",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "5ee68290db00ca0b79d57bc3a5bdce470de9ce9da0b098a7ce6c504605856c8f",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.0.2/ghc-8.0.2-x86_64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "517783b660a27ebf95b2568d47292fd633d5f9a4de4c80ad1ccf05e1b9d7313f",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "5ee68290db00ca0b79d57bc3a5bdce470de9ce9da0b098a7ce6c504605856c8f",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "ff50a2df9f002f33b9f09717ebf5ec5a47906b9b65cc57b1f9849f8b2e06788d",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "b36a20e5cae24d70bbb6116ae486f21811e9384f15d3892d260f02fba3e3bb8c",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "8c42c1f4af995205b9816a1e97e2752fe758544c1f5fe77958cdcd319c9c2d53",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-i386-deb7-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "07ead3a49f8c9df4b429e7a2f96f6f31bcab8d3ff8277a9aed0201d13ddad448",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "818621342a2161b8afcc995a0765816bb40aefbfa1db2c8a7d59c04d8b18228a",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.0.2/ghc-8.0.2-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "b4cd12a1048b2fff2f23c9eec0dd3a1174d54d017f8d79ec79af4534118e6881",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.0.2/ghc-8.0.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.0.2",
                            "dlHash": "818621342a2161b8afcc995a0765816bb40aefbfa1db2c8a7d59c04d8b18228a",
                        },
                    },
                },
            },
        },
        "8.2.2": {
            "viTags": [
                "base-4.10.1.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.2.2/docs/html/users_guide/8.2.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-src.tar.xz",
                "dlSubdir": "ghc-8.2.2",
                "dlHash": "bb8ec3634aa132d09faa270bbd604b82dfa61f04855655af6f9d14a9eedc05fc",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.2.2/ghc-8.2.2-testsuite.tar.xz",
                "dlSubdir": "ghc-8.2.2/testsuite",
                "dlHash": "927ff939f46a0f79aa87e16e56e0a024a288c78259bed874cb15aa96a653566c",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb7-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "cd7afbca54edf9890da9f432c63366556246c85c1198e40c99df5af01c555834",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "48e205c62b9dc1ccf6739a4bc15a71e56dde2f891a9d786a1b115f0286111b2a",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "48e205c62b9dc1ccf6739a4bc15a71e56dde2f891a9d786a1b115f0286111b2a",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "48e205c62b9dc1ccf6739a4bc15a71e56dde2f891a9d786a1b115f0286111b2a",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.2.2/ghc-8.2.2-x86_64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "adcf3a320a3c402aba07ae9586990dc3c0b550e96aeffb1b9e194313d3ba716d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb7-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "cd7afbca54edf9890da9f432c63366556246c85c1198e40c99df5af01c555834",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "f90fcf62f7e0936a6dfc3601cf663729bfe9bbf85097d2d75f0a16f8c2e95c27",
                        },
                    },
                    "FreeBSD": {
                        "( >= 10 && < 11 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-portbld10_3-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "9e99aaeaec4b2c6d660d80246c0d4dbd41fda88f1eb7a908b29dc8fa8d663949",
                        },
                        "( >= 11 && < 12 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-portbld11-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "cd351c704b92b9af23994024df07de8ca7090ea7675d5c8b14b2be857a46d804",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-portbld11-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "cd351c704b92b9af23994024df07de8ca7090ea7675d5c8b14b2be857a46d804",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "1e033df2092aa546e763e7be63167720b32df64f76673ea1ce7ae7c9f564b223",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-i386-deb7-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "cd18766b1a9b74fc6c90003a719ecab158f281f9a755d8b1bd3fd764ba6947b5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "9e67d72d76482e0ba91c718e727b00386a1a12a32ed719714976dc56ca8c8223",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "9e67d72d76482e0ba91c718e727b00386a1a12a32ed719714976dc56ca8c8223",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "9e67d72d76482e0ba91c718e727b00386a1a12a32ed719714976dc56ca8c8223",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.2.2/ghc-8.2.2-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "467534c32552cfd318753112dbc70af003693aad4b0081f2a07e61f5b5ea2c22",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.2.2",
                            "dlHash": "9e67d72d76482e0ba91c718e727b00386a1a12a32ed719714976dc56ca8c8223",
                        },
                    },
                },
            },
        },
        "8.4.1": {
            "viTags": [
                "base-4.11.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.4.1/docs/html/users_guide/8.4.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-src.tar.xz",
                "dlSubdir": "ghc-8.4.1",
                "dlHash": "39ae2f25192408f355693e5a3c8b6ff613ddb7c4da998fdf26210143a61839d2",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.4.1/ghc-8.4.1-testsuite.tar.xz",
                "dlSubdir": "ghc-8.4.1/testsuite",
                "dlHash": "6dfbbbeb1bb760698af99d82f05e4e0db3b3606d65be3fa779177117c6381841",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "427c77a934b30c3f1de992c38c072afb4323fe6fb30dbac919ca8cb6ae98fbd9",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "89328a013e64b9b56825a9071fea5616ddd623d37fd41e8fb913dfebc609e7ea",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "89328a013e64b9b56825a9071fea5616ddd623d37fd41e8fb913dfebc609e7ea",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "89328a013e64b9b56825a9071fea5616ddd623d37fd41e8fb913dfebc609e7ea",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "89328a013e64b9b56825a9071fea5616ddd623d37fd41e8fb913dfebc609e7ea",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "d774e39f3a0105843efd06709b214ee332c30203e6c5902dd6ed45e36285f9b7",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-portbld11-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "e748daec098445c6190090fe32bb2817a1140553be5acd2188e1af05ad24e5aa",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "328b013fc651d34e075019107e58bb6c8a578f0155cf3ad4557e6f2661b03131",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "c56c589c76c7ddcb77cdbef885a811761e669d3e76868b723d5be56dedcd4f69",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "c56c589c76c7ddcb77cdbef885a811761e669d3e76868b723d5be56dedcd4f69",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "c56c589c76c7ddcb77cdbef885a811761e669d3e76868b723d5be56dedcd4f69",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.1/ghc-8.4.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.1",
                            "dlHash": "c56c589c76c7ddcb77cdbef885a811761e669d3e76868b723d5be56dedcd4f69",
                        },
                    },
                },
            },
        },
        "8.4.2": {
            "viTags": [
                "base-4.11.1.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.4.2/docs/html/users_guide/8.4.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-src.tar.xz",
                "dlSubdir": "ghc-8.4.2",
                "dlHash": "01cc32f24a06bf3b2428351b6d7fec791e82d042426d29ad9e5a245b35f0047b",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.4.2/ghc-8.4.2-testsuite.tar.xz",
                "dlSubdir": "ghc-8.4.2/testsuite",
                "dlHash": "31315100daf5997df90c94d66747f597490ac37fca192fad9e6279af1ae05a35",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "246f66eb56f4ad0f1c7755502cfc8f9972f2d067dede17e151f6f479c1f76fbd",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "3f4f5bbd2cdab4e7015ada9196d8d9b3a1ad274293cef011f85c46854596cb57",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "d057b5c833596dbe4ae5d0dc2994f6cc5d0f4c2a21ea1d7900821d165fd4e846",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "3f4f5bbd2cdab4e7015ada9196d8d9b3a1ad274293cef011f85c46854596cb57",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "3f4f5bbd2cdab4e7015ada9196d8d9b3a1ad274293cef011f85c46854596cb57",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "d057b5c833596dbe4ae5d0dc2994f6cc5d0f4c2a21ea1d7900821d165fd4e846",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "d057b5c833596dbe4ae5d0dc2994f6cc5d0f4c2a21ea1d7900821d165fd4e846",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "d057b5c833596dbe4ae5d0dc2994f6cc5d0f4c2a21ea1d7900821d165fd4e846",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "87469222042b9ac23f9db216a8d4e5107297bdbbb99df71eb4d9e7208455def2",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "e9ed417fdf94c2ff2c6e344ed16f332bf6b591511f6442c0d9ea94854882b66c",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "797634aa9812fc6b2084a24ddb4fde44fa83a2f59daea82e0af81ca3dd323fde",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "2d849c30b4c1eac25dc74333501920921e22fa483153f404993808bbda93df05",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "2d849c30b4c1eac25dc74333501920921e22fa483153f404993808bbda93df05",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "2d849c30b4c1eac25dc74333501920921e22fa483153f404993808bbda93df05",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.2",
                            "dlHash": "2d849c30b4c1eac25dc74333501920921e22fa483153f404993808bbda93df05",
                        },
                    },
                },
            },
        },
        "8.4.3": {
            "viTags": [
                "base-4.11.1.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.4.3/docs/html/users_guide/8.4.3-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-src.tar.xz",
                "dlSubdir": "ghc-8.4.3",
                "dlHash": "ae47afda985830de8811243255aa3744dfb9207cb980af74393298b2b62160d6",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.4.3/ghc-8.4.3-testsuite.tar.xz",
                "dlSubdir": "ghc-8.4.3/testsuite",
                "dlHash": "ff43a015f803005dd9d9248ea9ffa92f9ebe79e146cfd044c3f48e0a7e58a5fc",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "30a402c6d4754a6c020e0547f19ae3ac42e907e35349aa932d347f73e421a8e2",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "2e4f53afb872ad9c640f31aea283b3ff4c5028b65808a1920739900aef7d15c9",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "269e7a4d3f336491b88409a020998122b30a3a729af78d33be86d3b3f8000c3e",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "2e4f53afb872ad9c640f31aea283b3ff4c5028b65808a1920739900aef7d15c9",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "2e4f53afb872ad9c640f31aea283b3ff4c5028b65808a1920739900aef7d15c9",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "269e7a4d3f336491b88409a020998122b30a3a729af78d33be86d3b3f8000c3e",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "269e7a4d3f336491b88409a020998122b30a3a729af78d33be86d3b3f8000c3e",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "269e7a4d3f336491b88409a020998122b30a3a729af78d33be86d3b3f8000c3e",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "af0b455f6c46b9802b4b48dad996619cfa27cc6e2bf2ce5532387b4a8c00aa64",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "8a83cfbf9ae84de0443c39c93b931693bdf2a6d4bf163ffb41855f80f4bf883e",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "f5763983a26dedd88b65a0b17267359a3981b83a642569b26334423f684f8b8c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "f5763983a26dedd88b65a0b17267359a3981b83a642569b26334423f684f8b8c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "f5763983a26dedd88b65a0b17267359a3981b83a642569b26334423f684f8b8c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.3/ghc-8.4.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.3",
                            "dlHash": "f5763983a26dedd88b65a0b17267359a3981b83a642569b26334423f684f8b8c",
                        },
                    },
                },
            },
        },
        "8.4.4": {
            "viTags": [
                "base-4.11.1.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.4.4/docs/html/users_guide/8.4.4-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-src.tar.xz",
                "dlSubdir": "ghc-8.4.4",
                "dlHash": "11117735a58e507c481c09f3f39ae5a314e9fbf49fc3109528f99ea7959004b2",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.4.4/ghc-8.4.4-testsuite.tar.xz",
                "dlSubdir": "ghc-8.4.4/testsuite",
                "dlHash": "46babc7629c9bce58204d6425e3726e35aa8dc58a8c4a7e44dc81ed975721469",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "4c2a8857f76b7f3e34ecba0b51015d5cb8b767fe5377a7ec477abde10705ab1a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "47c80a32d8f02838a2401414c94ba260d1fe82b7d090479994522242c767cc83",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "8ab2befddc14d1434d0aad0c5d3c7e0c2b78ff84caa3429fa62527bfc6b86095",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "47c80a32d8f02838a2401414c94ba260d1fe82b7d090479994522242c767cc83",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "47c80a32d8f02838a2401414c94ba260d1fe82b7d090479994522242c767cc83",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "8ab2befddc14d1434d0aad0c5d3c7e0c2b78ff84caa3429fa62527bfc6b86095",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "8ab2befddc14d1434d0aad0c5d3c7e0c2b78ff84caa3429fa62527bfc6b86095",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-centos70-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "83a96650f5a92b1e4d7651d256d6438624342d40e780e68125033435a54cd674",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "8ab2befddc14d1434d0aad0c5d3c7e0c2b78ff84caa3429fa62527bfc6b86095",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-centos70-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "83a96650f5a92b1e4d7651d256d6438624342d40e780e68125033435a54cd674",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.4.4/ghc-8.4.4-x86_64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "336affff8314d3dc5e85d9c09015ae2ba8a7658b459c8c8ae77ecaa551a56ae7",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-centos70-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "83a96650f5a92b1e4d7651d256d6438624342d40e780e68125033435a54cd674",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "8ab2befddc14d1434d0aad0c5d3c7e0c2b78ff84caa3429fa62527bfc6b86095",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "28dc89ebd231335337c656f4c5ead2ae2a1acc166aafe74a14f084393c5ef03a",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-portbld-freebsd11.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "44fbd142d1c355d6110595c59c760e2c73866ff9259ec85ebf814edb244d1940",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "da29dbb0f1199611c7d5bb7b0dd6a7426ca98f67dfd6da1526b033cd3830dc05",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "678bafaabea6af70ba71ccf0210bb437f9f5591ec28ac1cbbbd5f7aa6894e450",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "678bafaabea6af70ba71ccf0210bb437f9f5591ec28ac1cbbbd5f7aa6894e450",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "678bafaabea6af70ba71ccf0210bb437f9f5591ec28ac1cbbbd5f7aa6894e450",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.4.4/ghc-8.4.4-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "892888d388ef5c9cadf5cfba1146d62237c25b9b066fb62fee940b2b285fd308",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.4.4",
                            "dlHash": "678bafaabea6af70ba71ccf0210bb437f9f5591ec28ac1cbbbd5f7aa6894e450",
                        },
                    },
                },
            },
        },
        "8.6.1": {
            "viTags": [
                "base-4.12.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.6.1/docs/html/users_guide/8.6.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-src.tar.xz",
                "dlSubdir": "ghc-8.6.1",
                "dlHash": "2c25c26d1e5c47c7cbb2a1d8e6456524033e7a71409184dd3125e3fc5a3c7036",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.6.1/ghc-8.6.1-testsuite.tar.xz",
                "dlSubdir": "ghc-8.6.1/testsuite",
                "dlHash": "5fc72f7d8b2be6f56f33daf531f8d603d739b2b8460dee06725227fee10b69a7",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "6d8784401b7dd80c90fa17306ec0539920e3987399a2c7ef247989e53197dc42",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "97d44f303868d74e4d13a2e99c82ffce3d25fd54c704675e5a1939e0d824dbf0",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "da903fbcf11ee6c977a8b7dac3f04dbc098d674def587880b6624b8f32588beb",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "97d44f303868d74e4d13a2e99c82ffce3d25fd54c704675e5a1939e0d824dbf0",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "97d44f303868d74e4d13a2e99c82ffce3d25fd54c704675e5a1939e0d824dbf0",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "da903fbcf11ee6c977a8b7dac3f04dbc098d674def587880b6624b8f32588beb",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "da903fbcf11ee6c977a8b7dac3f04dbc098d674def587880b6624b8f32588beb",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "da903fbcf11ee6c977a8b7dac3f04dbc098d674def587880b6624b8f32588beb",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "9692cdfd202b0e039ea0c3dde5dbf653736c836ca1df46504b179b572100808c",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "51403b054a3a649039ac988e1d1112561f96750bfced63df864091a3fab36f08",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "7316d9cb5e486460476754f872c7bac30ee2082e42f46da4342f872d10b88099",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "83573af96e3dec8f67c1a844512f92cbf7d51ae7ceca53d948fc2a3300abd05c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "83573af96e3dec8f67c1a844512f92cbf7d51ae7ceca53d948fc2a3300abd05c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "83573af96e3dec8f67c1a844512f92cbf7d51ae7ceca53d948fc2a3300abd05c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.1/ghc-8.6.1-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.1",
                            "dlHash": "83573af96e3dec8f67c1a844512f92cbf7d51ae7ceca53d948fc2a3300abd05c",
                        },
                    },
                },
            },
        },
        "8.6.2": {
            "viTags": [
                "base-4.12.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.6.2/docs/html/users_guide/8.6.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-src.tar.xz",
                "dlSubdir": "ghc-8.6.2",
                "dlHash": "caaa819d21280ecde90a4773143dee188711e9ff175a27cfbaee56eb851d76d5",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.6.2/ghc-8.6.2-testsuite.tar.xz",
                "dlSubdir": "ghc-8.6.2/testsuite",
                "dlHash": "533fa60cffa29051b8c5e11b28ac662cfc464a3affe4f916a2ce0608f63fdbb7",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "13f96e8b83bb5bb60f955786ff9085744c24927a33be8a17773f84c7c248533a",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "702aa5dfa1639c37953ceb7571a5057d9fb0562aecb197b277953a037d78047d",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "13f96e8b83bb5bb60f955786ff9085744c24927a33be8a17773f84c7c248533a",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "13f96e8b83bb5bb60f955786ff9085744c24927a33be8a17773f84c7c248533a",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "702aa5dfa1639c37953ceb7571a5057d9fb0562aecb197b277953a037d78047d",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "702aa5dfa1639c37953ceb7571a5057d9fb0562aecb197b277953a037d78047d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "702aa5dfa1639c37953ceb7571a5057d9fb0562aecb197b277953a037d78047d",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "8ec46a25872226dd7e5cf7271e3f3450c05f32144b96e6b9cb44cc4079db50dc",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "9a398e133cab09ff2610834337355d4e26c35e0665403fb9ff8db79315f74d3d",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "a288026d9ef22f7ac387edab6b29ef7dcb3b28945c8ea532a15c1fa35d4733ed",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "a288026d9ef22f7ac387edab6b29ef7dcb3b28945c8ea532a15c1fa35d4733ed",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "a288026d9ef22f7ac387edab6b29ef7dcb3b28945c8ea532a15c1fa35d4733ed",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.2/ghc-8.6.2-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.2",
                            "dlHash": "a288026d9ef22f7ac387edab6b29ef7dcb3b28945c8ea532a15c1fa35d4733ed",
                        },
                    },
                },
            },
        },
        "8.6.3": {
            "viTags": [
                "base-4.12.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.6.3/docs/html/users_guide/8.6.3-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-src.tar.xz",
                "dlSubdir": "ghc-8.6.3",
                "dlHash": "9f9e37b7971935d88ba80426c36af14b1e0b3ec1d9c860f44a4391771bc07f23",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.6.3/ghc-8.6.3-testsuite.tar.xz",
                "dlSubdir": "ghc-8.6.3/testsuite",
                "dlHash": "d254cb0982a27a21c97bd50337d34ff8c5ce229cca7b237e672b1e4b67845c6e",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "291ca565374f4d51cc311488581f3279d3167a064fabfd4a6722fe2bd4532fd5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "e7954c8ed9b422a09c6ab737e4a0865a2725d034ba0e272bd5c70db910797f99",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "52ae92f4e8bb2ac0b7847287ea3da37081f5f7bf8bbb7c78ac35fde537d1a89f",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "e7954c8ed9b422a09c6ab737e4a0865a2725d034ba0e272bd5c70db910797f99",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "e7954c8ed9b422a09c6ab737e4a0865a2725d034ba0e272bd5c70db910797f99",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "52ae92f4e8bb2ac0b7847287ea3da37081f5f7bf8bbb7c78ac35fde537d1a89f",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "52ae92f4e8bb2ac0b7847287ea3da37081f5f7bf8bbb7c78ac35fde537d1a89f",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "355bd85c69933c31bbe99b4269ce719acfd0aad0b45e359ac39b9bb13996acc6",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "52ae92f4e8bb2ac0b7847287ea3da37081f5f7bf8bbb7c78ac35fde537d1a89f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "355bd85c69933c31bbe99b4269ce719acfd0aad0b45e359ac39b9bb13996acc6",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "355bd85c69933c31bbe99b4269ce719acfd0aad0b45e359ac39b9bb13996acc6",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "52ae92f4e8bb2ac0b7847287ea3da37081f5f7bf8bbb7c78ac35fde537d1a89f",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "79d069a1a7d74cfdd7ac2a2711c45d3ddc6265b988a0cefa342714b24f997fc1",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "bc2419fa180f8a7808c49775987866435995df9bdd9ce08bcd38352d63ba6031",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "2fec383904e5fa79413e9afd328faf9bc700006c8c3d4bcdd8d4f2ccf0f7fa2a",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "b57070ba8c70b1333a3e47ce124baf791be39c20a592954772532fd6dd51882f",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "b57070ba8c70b1333a3e47ce124baf791be39c20a592954772532fd6dd51882f",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "b57070ba8c70b1333a3e47ce124baf791be39c20a592954772532fd6dd51882f",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.3/ghc-8.6.3-i386-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.3",
                            "dlHash": "b57070ba8c70b1333a3e47ce124baf791be39c20a592954772532fd6dd51882f",
                        },
                    },
                },
            },
        },
        "8.6.4": {
            "viTags": [
                "base-4.12.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.6.4/docs/html/users_guide/8.6.4-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-src.tar.xz",
                "dlSubdir": "ghc-8.6.4",
                "dlHash": "5b5d07e4463203a433c3ed3df461ba6cce11b6d2b9b264db31f3429075d0303a",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.6.4/ghc-8.6.4-testsuite.tar.xz",
                "dlSubdir": "ghc-8.6.4/testsuite",
                "dlHash": "ea02d67ab24c0f5d147d7496e27b9043e3659d491defd2d1e1c7b0268feaebf9",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "34ef5fc8ddf2fc32a027180bea5b1c8a81ea840c87faace2977a572188d4b42d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "ef74222ef3c01c3fc5b926f67e8b4ef612fe8efa40ac937317cff9b0eed8d863",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "e0b1ada7a679d6c35f9d7a1192ed35fde054f3650bb0bd2570d103729ad3b846",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "ef74222ef3c01c3fc5b926f67e8b4ef612fe8efa40ac937317cff9b0eed8d863",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "ef74222ef3c01c3fc5b926f67e8b4ef612fe8efa40ac937317cff9b0eed8d863",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "e0b1ada7a679d6c35f9d7a1192ed35fde054f3650bb0bd2570d103729ad3b846",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "e0b1ada7a679d6c35f9d7a1192ed35fde054f3650bb0bd2570d103729ad3b846",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "e0b1ada7a679d6c35f9d7a1192ed35fde054f3650bb0bd2570d103729ad3b846",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "cccb58f142fe41b601d73690809f6089f7715b6a50a09aa3d0104176ab4db09e",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "e8d021b7a90772fc559862079da20538498d991956d7557b468ca19ddda22a08",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "5e2ce88f4d13d23ac37e278e0c7b51c801008931359b9fa8a631d804d2da552c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "5e2ce88f4d13d23ac37e278e0c7b51c801008931359b9fa8a631d804d2da552c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "5e2ce88f4d13d23ac37e278e0c7b51c801008931359b9fa8a631d804d2da552c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.4/ghc-8.6.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.4",
                            "dlHash": "5e2ce88f4d13d23ac37e278e0c7b51c801008931359b9fa8a631d804d2da552c",
                        },
                    },
                },
            },
        },
        "8.6.5": {
            "viTags": [
                "base-4.12.0.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.6.5/docs/html/users_guide/8.6.5-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-src.tar.xz",
                "dlSubdir": "ghc-8.6.5",
                "dlHash": "4d4aa1e96f4001b934ac6193ab09af5d6172f41f5a5d39d8e43393b9aafee361",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.6.5/ghc-8.6.5-testsuite.tar.xz",
                "dlSubdir": "ghc-8.6.5/testsuite",
                "dlHash": "21391cb63a8a6b327f6c9519217a3dad39493e72c48967008ae35af142ca895f",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "c419fd0aa9065fe4d2eb9a248e323860c696ddf3859749ca96a84938aee49107",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "bc75f5601a9f41d58b2ba161b9e28fad52143a7229060f1e084168d9b2e914df",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "cf78b53eaf336083e7a05f4a3000afbae4abe5bbc77ef80cc40e09d04ac5b4a1",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "bc75f5601a9f41d58b2ba161b9e28fad52143a7229060f1e084168d9b2e914df",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "bc75f5601a9f41d58b2ba161b9e28fad52143a7229060f1e084168d9b2e914df",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "cf78b53eaf336083e7a05f4a3000afbae4abe5bbc77ef80cc40e09d04ac5b4a1",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "cf78b53eaf336083e7a05f4a3000afbae4abe5bbc77ef80cc40e09d04ac5b4a1",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "80ab566f4411299f9e5922d60749ca80f989d697db19e03ed875619d699f0edf",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "cf78b53eaf336083e7a05f4a3000afbae4abe5bbc77ef80cc40e09d04ac5b4a1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "80ab566f4411299f9e5922d60749ca80f989d697db19e03ed875619d699f0edf",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.6.5/ghc-8.6.5-x86_64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "b9d3ed7f7aa24ef2d58bb579252289caa0b8877adee3685e3af2fb73d440afdc",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "80ab566f4411299f9e5922d60749ca80f989d697db19e03ed875619d699f0edf",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "cf78b53eaf336083e7a05f4a3000afbae4abe5bbc77ef80cc40e09d04ac5b4a1",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "dfc1bdb1d303a87a8552aa17f5b080e61351f2823c2b99071ec23d0837422169",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.6.5/ghc-8.6.5-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "83a3059a630d40a98e26cb5b520354e12094a96e36ba2f5ab002dad94cf2fb37",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "457024c6ea43bdce340af428d86319931f267089398b859b00efdfe2fd4ce93f",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "1cddb907393a669342b1a922dd16d505d9d93d50bd9433a54a8162f8701250dc",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "1cddb907393a669342b1a922dd16d505d9d93d50bd9433a54a8162f8701250dc",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "1cddb907393a669342b1a922dd16d505d9d93d50bd9433a54a8162f8701250dc",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.6.5/ghc-8.6.5-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "3737837550d9b177acfe150e3a3cd4545427ded020487c2ed5194d7b8f116349",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "1cddb907393a669342b1a922dd16d505d9d93d50bd9433a54a8162f8701250dc",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.6.5/ghc-8.6.5-aarch64-ubuntu18.04-linux.tar.xz",
                            "dlSubdir": "ghc-8.6.5",
                            "dlHash": "1852589037e4b2805ab517bc430e25a3125c4a118a1674ffefbb443394a0c786",
                        },
                    },
                },
            },
        },
        "8.8.1": {
            "viTags": [
                "base-4.13.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.8.1/docs/html/users_guide/8.8.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-src.tar.xz",
                "dlSubdir": "ghc-8.8.1",
                "dlHash": "908a83d9b814da74585de9d39687189e6260ec3848131f9d9236cab8a123721a",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.8.1/ghc-8.8.1-testsuite.tar.xz",
                "dlSubdir": "ghc-8.8.1/testsuite",
                "dlHash": "c77df6c398eeb977a62755268f1673cd3300da7093e786c73c419d47d6050ef3",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "fd96eb851971fbc3332bf2fa7821732cfa8b37e5a076a69f6a06f83f0ea7ccc5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "620fd560535b63cac5f8c97354ccddf93fa940cca78e2d19f6f98b7e67c6a723",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "851a78df620bc056c34b252c97040d5755e294993fa8afa5429708b5229204d6",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "620fd560535b63cac5f8c97354ccddf93fa940cca78e2d19f6f98b7e67c6a723",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "620fd560535b63cac5f8c97354ccddf93fa940cca78e2d19f6f98b7e67c6a723",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "851a78df620bc056c34b252c97040d5755e294993fa8afa5429708b5229204d6",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "851a78df620bc056c34b252c97040d5755e294993fa8afa5429708b5229204d6",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "6cdd34e4dbaeb801e805811f91cf43a2d5f64b22f884718ffbd3542a2f4dd14f",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "851a78df620bc056c34b252c97040d5755e294993fa8afa5429708b5229204d6",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "6cdd34e4dbaeb801e805811f91cf43a2d5f64b22f884718ffbd3542a2f4dd14f",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "6cdd34e4dbaeb801e805811f91cf43a2d5f64b22f884718ffbd3542a2f4dd14f",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "851a78df620bc056c34b252c97040d5755e294993fa8afa5429708b5229204d6",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "38c8917b47c31bedf58c9305dfca3abe198d8d35570366f0773c4e2948bd8abe",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "29e56e6af38017a5a76b2b6995a39d3988fa58131e4b55b62dd317ba7186ac9b",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "3d3bb75aff2dd79ec87ace10483368681fbc328ff00ebf15edad33420f00f7f5",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "3d3bb75aff2dd79ec87ace10483368681fbc328ff00ebf15edad33420f00f7f5",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "3d3bb75aff2dd79ec87ace10483368681fbc328ff00ebf15edad33420f00f7f5",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.1/ghc-8.8.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.1",
                            "dlHash": "3d3bb75aff2dd79ec87ace10483368681fbc328ff00ebf15edad33420f00f7f5",
                        },
                    },
                },
            },
        },
        "8.8.2": {
            "viTags": [
                "base-4.13.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.8.2/docs/html/users_guide/8.8.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-src.tar.xz",
                "dlSubdir": "ghc-8.8.2",
                "dlHash": "01cea54d90686b97bcc9960b108beaffccd4336dee930dcf9beaf52b1f370a0b",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.8.2/ghc-8.8.2-testsuite.tar.xz",
                "dlSubdir": "ghc-8.8.2/testsuite",
                "dlHash": "e93845f082cb272ae822df9a07425d05781fe1a3a4b82078de9e61c9a8cc64bd",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "fbe69652eba75dadb758d00292247d17fb018c29cac5acd79843e56311256c9f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "7b2d66c2d5d8c15750da5833d3018634a5eb792a5662282e3abfeb112c2a1cc3",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "dbe2db717b33460f790e155e487d2a31c9b21a9d245f0c9490ad65844c3ea21f",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "7b2d66c2d5d8c15750da5833d3018634a5eb792a5662282e3abfeb112c2a1cc3",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "7b2d66c2d5d8c15750da5833d3018634a5eb792a5662282e3abfeb112c2a1cc3",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "dbe2db717b33460f790e155e487d2a31c9b21a9d245f0c9490ad65844c3ea21f",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "dbe2db717b33460f790e155e487d2a31c9b21a9d245f0c9490ad65844c3ea21f",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "f065a017d7a38f235f186ffe32d8261a4fd39c7e945d5cde85c0984c2569db99",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "dbe2db717b33460f790e155e487d2a31c9b21a9d245f0c9490ad65844c3ea21f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "f065a017d7a38f235f186ffe32d8261a4fd39c7e945d5cde85c0984c2569db99",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "f065a017d7a38f235f186ffe32d8261a4fd39c7e945d5cde85c0984c2569db99",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "dbe2db717b33460f790e155e487d2a31c9b21a9d245f0c9490ad65844c3ea21f",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "25c5c1a70036abf3f22b2b19c10d26adfdb08e8f8574f89d4b2042de5947f990",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "e25d9b16ee62cafc7387af2cd021eea676a99cd2c32b83533b016162c63065d9",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "ad1c628082c32635a436905a7ff83eaa4246347d869be5ef6b33c3bf85e8f00c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "ad1c628082c32635a436905a7ff83eaa4246347d869be5ef6b33c3bf85e8f00c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "ad1c628082c32635a436905a7ff83eaa4246347d869be5ef6b33c3bf85e8f00c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.2/ghc-8.8.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.2",
                            "dlHash": "ad1c628082c32635a436905a7ff83eaa4246347d869be5ef6b33c3bf85e8f00c",
                        },
                    },
                },
            },
        },
        "8.8.3": {
            "viTags": [
                "base-4.13.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.8.3/docs/html/users_guide/8.8.3-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-src.tar.xz",
                "dlSubdir": "ghc-8.8.3",
                "dlHash": "e0dcc0aaf3e234c5978f29e6df62947e97720ab404ec0158343df211c5480f89",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.8.3/ghc-8.8.3-testsuite.tar.xz",
                "dlSubdir": "ghc-8.8.3/testsuite",
                "dlHash": "f9caa452f458e3b540e323bf8216e2712ed21576e205acddd4e2504ad2ad62d0",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "92b9fadc442976968d2c190c14e000d737240a7d721581cda8d8741b7bd402f0",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "42fde2ef5a143e1e6b47ae8875162ea2d4d54b06f0f7fa32ee4f0eb86f2be7ad",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "45ee1de3bfc98cbcc4886b65fc7651ade2d3820aa85eac2dbe9bc7bf91e7c818",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "42fde2ef5a143e1e6b47ae8875162ea2d4d54b06f0f7fa32ee4f0eb86f2be7ad",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "42fde2ef5a143e1e6b47ae8875162ea2d4d54b06f0f7fa32ee4f0eb86f2be7ad",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "45ee1de3bfc98cbcc4886b65fc7651ade2d3820aa85eac2dbe9bc7bf91e7c818",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "45ee1de3bfc98cbcc4886b65fc7651ade2d3820aa85eac2dbe9bc7bf91e7c818",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "4b2b5313f7c12b81e54efcb26705fa9e4ad5b98f2b58bfc76fb0c9ba1d55eb1f",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "45ee1de3bfc98cbcc4886b65fc7651ade2d3820aa85eac2dbe9bc7bf91e7c818",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "4b2b5313f7c12b81e54efcb26705fa9e4ad5b98f2b58bfc76fb0c9ba1d55eb1f",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "4b2b5313f7c12b81e54efcb26705fa9e4ad5b98f2b58bfc76fb0c9ba1d55eb1f",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "45ee1de3bfc98cbcc4886b65fc7651ade2d3820aa85eac2dbe9bc7bf91e7c818",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "7016de90dd226b06fc79d0759c5d4c83c2ab01d8c678905442c28bd948dbb782",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.8.3/ghc-8.8.3-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "569719075b4d14b3875a899df522090ae31e6fe085e6dffe518e875b09a2f0be",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "e22586762af0911c06e8140f1792e3ca381a3a482a20d67b9054883038b3a422",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "441e2c7a4fc83ebf179712bd939b555cda7c6633545b7c8ac38049f9d85003ae",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "441e2c7a4fc83ebf179712bd939b555cda7c6633545b7c8ac38049f9d85003ae",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "441e2c7a4fc83ebf179712bd939b555cda7c6633545b7c8ac38049f9d85003ae",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "441e2c7a4fc83ebf179712bd939b555cda7c6633545b7c8ac38049f9d85003ae",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.3/ghc-8.8.3-aarch64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.3",
                            "dlHash": "2a6821d0e7326cfa7670851702924bbab3b092415ba41247c37419158327eed9",
                        },
                    },
                },
            },
        },
        "8.8.4": {
            "viTags": [
                "base-4.13.0.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.8.4/docs/html/users_guide/8.8.4-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-src.tar.xz",
                "dlSubdir": "ghc-8.8.4",
                "dlHash": "f0505e38b2235ff9f1090b51f44d6c8efd371068e5a6bb42a2a6d8b67b5ffc2d",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.8.4/ghc-8.8.4-testsuite.tar.xz",
                "dlSubdir": "ghc-8.8.4/testsuite",
                "dlHash": "9f84396e6fe9c0ccbdde24d12cbbc64f5662b519c65d38633602038184bca530",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 9": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-deb8-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "51a36892f1264744195274187298d13ac62bce2da86d4ddf76d8054ab90f2feb",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "4862559d221153caf978f4bf2c15a82c114d1e1f43b298b2ecff2ac94b586d20",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "f32e37f8aa03e74bad533ae02f62dc27a4521e78199576af490888ba34b515db",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "4862559d221153caf978f4bf2c15a82c114d1e1f43b298b2ecff2ac94b586d20",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "4862559d221153caf978f4bf2c15a82c114d1e1f43b298b2ecff2ac94b586d20",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "f32e37f8aa03e74bad533ae02f62dc27a4521e78199576af490888ba34b515db",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "f32e37f8aa03e74bad533ae02f62dc27a4521e78199576af490888ba34b515db",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "a12aa4b1fd3c64240a8a6d15196d33e1c0e0d55b51ff78c387242126d0ef7910",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "f32e37f8aa03e74bad533ae02f62dc27a4521e78199576af490888ba34b515db",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "a12aa4b1fd3c64240a8a6d15196d33e1c0e0d55b51ff78c387242126d0ef7910",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.8.4/ghc-8.8.4-x86_64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "90c6a1661de7f20c7d169cd6270125035b3332063e45103ce028df0beecf434e",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "a12aa4b1fd3c64240a8a6d15196d33e1c0e0d55b51ff78c387242126d0ef7910",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "f32e37f8aa03e74bad533ae02f62dc27a4521e78199576af490888ba34b515db",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "e80a789e9d8cfb41dd87f3284b75432427c4461c1731d220d04ead8733ccdb5e",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.8.4/ghc-8.8.4-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "8cebe5ccf454e82acd1ff52ca57590d1ab0f3f44a981b46257ec12158c8c447e",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "d185055d2c8dc3bfe5b88afd59d6877eb1e722b672d1c9649f18296e148ed71f",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "43dd954910c9027694312cef0aabc7774d102d0422b7172802cfb72f7d5da3a0",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "43dd954910c9027694312cef0aabc7774d102d0422b7172802cfb72f7d5da3a0",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "43dd954910c9027694312cef0aabc7774d102d0422b7172802cfb72f7d5da3a0",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.8.4/ghc-8.8.4-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "1d18e89ee031197e55c48683e78a7ffc67601ac5fd9f73aac555eb064b3859a2",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.8.4/ghc-8.8.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.8.4",
                            "dlHash": "43dd954910c9027694312cef0aabc7774d102d0422b7172802cfb72f7d5da3a0",
                        },
                    },
                },
            },
        },
        "8.10.1": {
            "viTags": [
                "base-4.14.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.1/docs/html/users_guide/8.10.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-src.tar.xz",
                "dlSubdir": "ghc-8.10.1",
                "dlHash": "4e3b07f83a266b3198310f19f71e371ebce97c769b14f0d688f4cbf2a2a1edf5",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.1/ghc-8.10.1-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.1/testsuite",
                "dlHash": "37cf67b04bcf00ae78914e4612db9d959bc5bd455a27ea5f6461100137c0b800",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "d1cf7886f27af070f3b7dbe1975a78b43ef2d32b86362cbe953e79464fe70761",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "c1e31d798b013699b3c0de4fda27fb4cda47f572df0e75e3bd598a3012060615",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "c1e31d798b013699b3c0de4fda27fb4cda47f572df0e75e3bd598a3012060615",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "3c4cd72b4806045779739e8f5d1658e30e57123d88c2c8966422cdbcae448470",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "d1cf7886f27af070f3b7dbe1975a78b43ef2d32b86362cbe953e79464fe70761",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "d1cf7886f27af070f3b7dbe1975a78b43ef2d32b86362cbe953e79464fe70761",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "3c4cd72b4806045779739e8f5d1658e30e57123d88c2c8966422cdbcae448470",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "3c4cd72b4806045779739e8f5d1658e30e57123d88c2c8966422cdbcae448470",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "3c4cd72b4806045779739e8f5d1658e30e57123d88c2c8966422cdbcae448470",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "0618b94854edc6be5302489df905e627820b71be6b66c950f5e3088fe92df0a1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "0618b94854edc6be5302489df905e627820b71be6b66c950f5e3088fe92df0a1",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "3c4cd72b4806045779739e8f5d1658e30e57123d88c2c8966422cdbcae448470",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "0618b94854edc6be5302489df905e627820b71be6b66c950f5e3088fe92df0a1",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-alpine3.10-linux-integer-simple.tar.xz",
                            "dlSubdir": "ghc-8.10.1-x86_64-unknown-linux",
                            "dlHash": "cb13b645d103e2fba2eb8dfcc4e5f2fbd9550c00c4df42f342b4210436dcb8a8",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "0618b94854edc6be5302489df905e627820b71be6b66c950f5e3088fe92df0a1",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "3c4cd72b4806045779739e8f5d1658e30e57123d88c2c8966422cdbcae448470",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "65b1ca361093de4804a7e40b3e68178e1ef720f84f743641ec8d95e56a45b3a8",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.10.1/ghc-8.10.1-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "e8646ec9b60fd40aa9505ee055f22f04601290ab7a1342c2cf37c34de9d3f142",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "38a3166ea50cccd5bae7e1680eae3aae2b4ae31b61f82a1d8168fb821f43bd67",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "8b53eef2c827b5f634d72920a93c0c9dd66ea288691a2bfe28def45d3c686ee2",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "8b53eef2c827b5f634d72920a93c0c9dd66ea288691a2bfe28def45d3c686ee2",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "8b53eef2c827b5f634d72920a93c0c9dd66ea288691a2bfe28def45d3c686ee2",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "8b53eef2c827b5f634d72920a93c0c9dd66ea288691a2bfe28def45d3c686ee2",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.10.1/ghc-8.10.1-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "7360cc6b29e9b4ab08f6ea5bc3bcca6f5c216933e81ef1620dcdd700f1fdb289",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "8b53eef2c827b5f634d72920a93c0c9dd66ea288691a2bfe28def45d3c686ee2",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-aarch64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "c099011e07999db917e797fb5d89c31f075a562556ab99be8ab0accbf2a94db7",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.1/ghc-8.10.1-armv7-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.1",
                            "dlHash": "afe1bde2b0d6deb0320b9460fffe5d9427e302df85aec866b9c1458777d52b28",
                        },
                    },
                },
            },
        },
        "8.10.2": {
            "viTags": [
                "old",
                "base-4.14.1.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.2/docs/html/users_guide/8.10.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-src.tar.xz",
                "dlSubdir": "ghc-8.10.2",
                "dlHash": "9c573a4621a78723950617c223559bdc325ea6a3409264aedf68f05510b0880b",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.2/ghc-8.10.2-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.2/testsuite",
                "dlHash": "3a4aac2f2fba635499bb8c946c19410a37740e5d26c3e6816304b29cfa426a29",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "4dbe3b479e76767bfeb4cbb7a4db8b761c4720266193483ca370b2ace3f10f7c",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "94513d82c38c848f489113a75fa5ef4e5a8e3ecfaa74ca90e2620d2193ff1632",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "94513d82c38c848f489113a75fa5ef4e5a8e3ecfaa74ca90e2620d2193ff1632",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "8c675da83e9b3c2f64ebb407b5f9ebb2c1f21aa5d701020614fdce644a542e3b",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "4dbe3b479e76767bfeb4cbb7a4db8b761c4720266193483ca370b2ace3f10f7c",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "4dbe3b479e76767bfeb4cbb7a4db8b761c4720266193483ca370b2ace3f10f7c",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "8c675da83e9b3c2f64ebb407b5f9ebb2c1f21aa5d701020614fdce644a542e3b",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "8c675da83e9b3c2f64ebb407b5f9ebb2c1f21aa5d701020614fdce644a542e3b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "8c675da83e9b3c2f64ebb407b5f9ebb2c1f21aa5d701020614fdce644a542e3b",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "fd2dccd6f496915a5f962dab24e7eeb8bee49bcc38e74b17eac76159083538fa",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "fd2dccd6f496915a5f962dab24e7eeb8bee49bcc38e74b17eac76159083538fa",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "8c675da83e9b3c2f64ebb407b5f9ebb2c1f21aa5d701020614fdce644a542e3b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "fd2dccd6f496915a5f962dab24e7eeb8bee49bcc38e74b17eac76159083538fa",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-alpine3.10-linux-integer-simple.tar.xz",
                            "dlSubdir": "ghc-8.10.2-x86_64-unknown-linux",
                            "dlHash": "14d09a508f2a3a11875c140be8e6c5f6982ac5cd448f089ca10b7adc955fec76",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "fd2dccd6f496915a5f962dab24e7eeb8bee49bcc38e74b17eac76159083538fa",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "8c675da83e9b3c2f64ebb407b5f9ebb2c1f21aa5d701020614fdce644a542e3b",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "edb772b00c0d7f18bb56ad27765162ee09c508104d40f82128c9114a02f6cfc2",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-unknown-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9e5957f3497f4b58ecd3699568d9caaa11a47a6d7e902032c261e450fa0f6686",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "dcae4c173b9896e07ff048de5509aa0a4537233150e06e5ce8848303dfadc176",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9dae2a86ad43d08f72c783542c944d1556b075aa20a8063efae5034ea88e7c2f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9dae2a86ad43d08f72c783542c944d1556b075aa20a8063efae5034ea88e7c2f",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9dae2a86ad43d08f72c783542c944d1556b075aa20a8063efae5034ea88e7c2f",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9dae2a86ad43d08f72c783542c944d1556b075aa20a8063efae5034ea88e7c2f",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9dae2a86ad43d08f72c783542c944d1556b075aa20a8063efae5034ea88e7c2f",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.10.2/ghc-8.10.2-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "9ee1cf1e85e9536088b3c9e80e975074e525ea378cd4eb156071bbc4b7b38327",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "5cf24189077e6e2dce2aa16367ad8a53f603e751a15010dfb23d067206e55593",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.2/ghc-8.10.2-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.2",
                            "dlHash": "bb9c97826b1f4d7a8ef8bce0616b612f1ded10480ef10fcf7fb4e6d10a6681c8",
                        },
                    },
                },
            },
        },
        "8.10.3": {
            "viTags": [
                "old",
                "base-4.14.1.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.3/docs/html/users_guide/8.10.3-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-src.tar.xz",
                "dlSubdir": "ghc-8.10.3",
                "dlHash": "ccdc8319549028a708d7163e2967382677b1a5a379ff94d948195b5cf46eb931",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.3/ghc-8.10.3-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.3/testsuite",
                "dlHash": "8f82e69067fe69a1fd0916325d8c76c90b050393e9c37a70274d60f9b34cfe00",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "95e4aadea30701fe5ab84d15f757926d843ded7115e11c4cd827809ca830718d",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "c8f3d9f0e61a89eaba1d3ad8fb2eced1af0e81576811261b887993bee12538ac",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "c8f3d9f0e61a89eaba1d3ad8fb2eced1af0e81576811261b887993bee12538ac",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f8739b12008712d6b6a9ffc6c39f9d05af77ef3bcb932c9aff20fa0893c8c159",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "95e4aadea30701fe5ab84d15f757926d843ded7115e11c4cd827809ca830718d",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "95e4aadea30701fe5ab84d15f757926d843ded7115e11c4cd827809ca830718d",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f8739b12008712d6b6a9ffc6c39f9d05af77ef3bcb932c9aff20fa0893c8c159",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f8739b12008712d6b6a9ffc6c39f9d05af77ef3bcb932c9aff20fa0893c8c159",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f8739b12008712d6b6a9ffc6c39f9d05af77ef3bcb932c9aff20fa0893c8c159",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f562ca61979ff1d21e34e69e59028cb742a8eff8d84e46bbd3a750f2ac7d8ed1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f562ca61979ff1d21e34e69e59028cb742a8eff8d84e46bbd3a750f2ac7d8ed1",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f8739b12008712d6b6a9ffc6c39f9d05af77ef3bcb932c9aff20fa0893c8c159",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f562ca61979ff1d21e34e69e59028cb742a8eff8d84e46bbd3a750f2ac7d8ed1",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/curated/8.10.3/ghc-8.10.3-x86_64-alpine3.10-linux-integer-simple.tar.xz",
                            "dlSubdir": "ghc-8.10.3-x86_64-unknown-linux",
                            "dlHash": "94aa382fe04f25d2c315814381aceb7755e84675b2f7c8ce69a0faa36947203c",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f562ca61979ff1d21e34e69e59028cb742a8eff8d84e46bbd3a750f2ac7d8ed1",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f8739b12008712d6b6a9ffc6c39f9d05af77ef3bcb932c9aff20fa0893c8c159",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "2635f35d76e44e69afdfd37cae89d211975cc20f71f784363b72003e59f22015",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "749007e995104db05cf6e3ad5bc36238cab8afac8055145661e5730e8f8af040",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "927a6c699533a115cd49772ef2c753d9af2c13bf9f0b2d3bd13645cc6a144ee3",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f0addd2a16b705f58ff9e8702c3ddf3e2d6bd0d3555707b5b5095e51bafee7b1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f0addd2a16b705f58ff9e8702c3ddf3e2d6bd0d3555707b5b5095e51bafee7b1",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f0addd2a16b705f58ff9e8702c3ddf3e2d6bd0d3555707b5b5095e51bafee7b1",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f0addd2a16b705f58ff9e8702c3ddf3e2d6bd0d3555707b5b5095e51bafee7b1",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "f0addd2a16b705f58ff9e8702c3ddf3e2d6bd0d3555707b5b5095e51bafee7b1",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.10.3/ghc-8.10.3-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "309201cdefd2d13b8b3fd09c26c6137048c490d219a0a9c7407c3ce1d011f60c",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "a531432d505a1fe886cdc8639d168eb1c92d76464c1270713e01ce81891bbadb",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.3/ghc-8.10.3-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.3",
                            "dlHash": "b823b58cae36fbac0741680ca7605180fa4cf4c6ae439123d282184b94d32fd6",
                        },
                    },
                },
            },
        },
        "8.10.4": {
            "viTags": [
                "old",
                "base-4.14.1.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.4/docs/html/users_guide/8.10.4-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-src.tar.xz",
                "dlSubdir": "ghc-8.10.4",
                "dlHash": "52af871b4e08550257d720c2944ac85727d0b948407cef1bebfe7508c224910e",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.4/ghc-8.10.4-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.4/testsuite",
                "dlHash": "01cbec3cf5d7e17dcafe98a7645b43205c10d8592e6c0de1f5dcbf0b60a074ca",
            },
            "viPreCompile": "If you have autoconf >= 2.70 you'll need this patch https://gitlab.haskell.org/ghc/ghc/-/snippets/2040 (see the --patchdir option)",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "5694200a5c38f22c142baf850b1d2f3784211d2ec9302e11693259a1ae8e38b7",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "816365565e9927459b035515a7db6a0db62f9796f327389b6f8a0035d12fbda0",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "816365565e9927459b035515a7db6a0db62f9796f327389b6f8a0035d12fbda0",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "a189eed900a8717d6d7906bafd10b9a9a9688ad942d1c75e19df480376dff9ea",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "5694200a5c38f22c142baf850b1d2f3784211d2ec9302e11693259a1ae8e38b7",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "5694200a5c38f22c142baf850b1d2f3784211d2ec9302e11693259a1ae8e38b7",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "a189eed900a8717d6d7906bafd10b9a9a9688ad942d1c75e19df480376dff9ea",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "a189eed900a8717d6d7906bafd10b9a9a9688ad942d1c75e19df480376dff9ea",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "a189eed900a8717d6d7906bafd10b9a9a9688ad942d1c75e19df480376dff9ea",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "fb8a91f0cf06594172aff46c2f6f7486179e1c3760855c79fbdd3012598cc2cd",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "fb8a91f0cf06594172aff46c2f6f7486179e1c3760855c79fbdd3012598cc2cd",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "a189eed900a8717d6d7906bafd10b9a9a9688ad942d1c75e19df480376dff9ea",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "fb8a91f0cf06594172aff46c2f6f7486179e1c3760855c79fbdd3012598cc2cd",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-alpine3.10-linux-integer-simple.tar.xz",
                            "dlSubdir": "ghc-8.10.4-x86_64-unknown-linux",
                            "dlHash": "74c2c07537832708502716ef4ec40019f8e552ddda13c8eadf8f7c4b03a79359",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "fb8a91f0cf06594172aff46c2f6f7486179e1c3760855c79fbdd3012598cc2cd",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "a189eed900a8717d6d7906bafd10b9a9a9688ad942d1c75e19df480376dff9ea",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "725ecf6543e63b81a3581fb8c97afd21a08ae11bc0fa4f8ee25d45f0362ef6d5",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "c9776a2ccf9629b03e967206a507fcdcb6c5189800a626e9461ababf6733c357",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "e9175a276504c3390a5e0084954e6997d56078737dbe7158049518892cf6bfb2",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "0022c5b9ac22825bb7b4745af3d92cef0ba1ecd01fab3ef387ddbd47146569ad",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "0022c5b9ac22825bb7b4745af3d92cef0ba1ecd01fab3ef387ddbd47146569ad",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "0022c5b9ac22825bb7b4745af3d92cef0ba1ecd01fab3ef387ddbd47146569ad",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "0022c5b9ac22825bb7b4745af3d92cef0ba1ecd01fab3ef387ddbd47146569ad",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "0022c5b9ac22825bb7b4745af3d92cef0ba1ecd01fab3ef387ddbd47146569ad",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/8.10.4/ghc-8.10.4-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "9161a98bed763692101854d83af69c1316030cfe5ee6f6acde283d04ef139735",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "249da6310be799a5eefe0579b6dae1701eb984afb980fe08309d19cf704038ed",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.4",
                            "dlHash": "0d18ef83593272f6196a41cc3abdc48dfe5e14372db75d71ea19fe35320c4e81",
                        },
                    },
                },
            },
        },
        "8.10.5": {
            "viTags": [
                "old",
                "base-4.14.2.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.5/docs/html/users_guide/8.10.5-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-src.tar.xz",
                "dlSubdir": "ghc-8.10.5",
                "dlHash": "f10941f16e4fbd98580ab5241b9271bb0851304560c4d5ca127e3b0e20e3076f",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.5/ghc-8.10.5-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.5/testsuite",
                "dlHash": "a69924a8447614bce0137589666e445f61713b65e51e68f546d82c97c939986d",
            },
            "viPreCompile": "If you have autoconf >= 2.70 you'll need this patch https://gitlab.haskell.org/ghc/ghc/-/snippets/2040 (see the --patchdir option)",
            "viPostInstall": "GHC 8.10.5 and 8.10.6 have several issues on Darwin, e.g.\n  https://gitlab.haskell.org/ghc/ghc/-/issues/19950\nConsider upgrading to 8.10.7 via\n  ghcup install ghc --set 8.10.7\n",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "15e71325c3bdfe3804be0f84c2fc5c913d811322d19b0f4d4cff20f29cdd804d",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "bc623c20ca4c5c18e952071ba14aa0cfc5c94d34219bffaa615f7b491f376787",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "bc623c20ca4c5c18e952071ba14aa0cfc5c94d34219bffaa615f7b491f376787",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "73528ebfb219b50aa9042ee51a0a2bd764828d605f058404989d0b645752d210",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "15e71325c3bdfe3804be0f84c2fc5c913d811322d19b0f4d4cff20f29cdd804d",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "15e71325c3bdfe3804be0f84c2fc5c913d811322d19b0f4d4cff20f29cdd804d",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "73528ebfb219b50aa9042ee51a0a2bd764828d605f058404989d0b645752d210",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "73528ebfb219b50aa9042ee51a0a2bd764828d605f058404989d0b645752d210",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "73528ebfb219b50aa9042ee51a0a2bd764828d605f058404989d0b645752d210",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "4cdb259ec74d1408dab45dab20dcedc21690f39921c2ea4546486fb3e81f4fbd",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "4cdb259ec74d1408dab45dab20dcedc21690f39921c2ea4546486fb3e81f4fbd",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "73528ebfb219b50aa9042ee51a0a2bd764828d605f058404989d0b645752d210",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "4cdb259ec74d1408dab45dab20dcedc21690f39921c2ea4546486fb3e81f4fbd",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-alpine3.10-linux-integer-simple.tar.xz",
                            "dlSubdir": "ghc-8.10.5-x86_64-unknown-linux",
                            "dlHash": "f4d7cd9ed12a4b8592219c9a63a86db1a256a09fa9e6ed755a60afc57dc782e2",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "4cdb259ec74d1408dab45dab20dcedc21690f39921c2ea4546486fb3e81f4fbd",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "73528ebfb219b50aa9042ee51a0a2bd764828d605f058404989d0b645752d210",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "ef0f47eff8962d58fa447123636cf8ef31c1e5b2d0ae90177d3388861ddf4a22",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/8.10.5/ghc-8.10.5-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "11a0b490bfb2f57b5bc87c69c197542eafce1b4991cc22f625179a6c6e567834",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "4443d989df4f2680f681a4d8b8db310ce9582d21743984016b0eb0163b0c9998",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "0ccb5b2c1222374874795c35410754dd650f649b774872abbea2a4ef21ac9c9d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "0ccb5b2c1222374874795c35410754dd650f649b774872abbea2a4ef21ac9c9d",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "0ccb5b2c1222374874795c35410754dd650f649b774872abbea2a4ef21ac9c9d",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "0ccb5b2c1222374874795c35410754dd650f649b774872abbea2a4ef21ac9c9d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "0ccb5b2c1222374874795c35410754dd650f649b774872abbea2a4ef21ac9c9d",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/8.10.5/ghc-8.10.5-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "0e91abe61607f9375d4e252ee9c261e4856df396f60641bb1b880ab8a3a83ea7",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "9a085cd8a7f8e0ace21ac67dbf659a56fcf41564b48817ba42cd8a1aac7f0ddc",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "03684e70ff03d041b9a4e0f84c177953a241ab8ec7a028c72fa21ac67e66cb09",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.5/ghc-8.10.5-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.5",
                            "dlHash": "56170d1a8450e18b7eb9c23c94723da352815b27ec250bb23742a62f16dcab6c",
                        },
                    },
                },
            },
        },
        "8.10.6": {
            "viTags": [
                "old",
                "base-4.14.3.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.6/docs/html/users_guide/8.10.6-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-src.tar.xz",
                "dlSubdir": "ghc-8.10.6",
                "dlHash": "43afba72a533408b42c1492bd047b5e37e5f7204e41a5cedd3182cc841610ce9",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.6/ghc-8.10.6-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.6/testsuite",
                "dlHash": "eb25f53c0bcd0bf49a7b49dda1f87de461fd933b3f6b5162b6f89d484dbdf2b9",
            },
            "viPreCompile": "If you have autoconf >= 2.70 you'll need this patch https://gitlab.haskell.org/ghc/ghc/-/snippets/2040 (see the --patchdir option)",
            "viPostInstall": "GHC 8.10.5 and 8.10.6 have several issues on Darwin, e.g.\n  https://gitlab.haskell.org/ghc/ghc/-/issues/19950\nConsider upgrading to 8.10.7 via\n  ghcup install ghc --set 8.10.7\n",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c14b631437ebc867f1fe1648579bc1dbe1a9b9ad31d7c801c3c77639523a83ae",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "95be925e310b8c419e1099d620a727a1ca2d8c918f33eb905a8221d7eb16467b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "95be925e310b8c419e1099d620a727a1ca2d8c918f33eb905a8221d7eb16467b",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c452b84565cfc07c476694dd0fd389ed6d2b83619490b3c238f6bded438eddb1",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c14b631437ebc867f1fe1648579bc1dbe1a9b9ad31d7c801c3c77639523a83ae",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c14b631437ebc867f1fe1648579bc1dbe1a9b9ad31d7c801c3c77639523a83ae",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c452b84565cfc07c476694dd0fd389ed6d2b83619490b3c238f6bded438eddb1",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c452b84565cfc07c476694dd0fd389ed6d2b83619490b3c238f6bded438eddb1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c452b84565cfc07c476694dd0fd389ed6d2b83619490b3c238f6bded438eddb1",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "71bb69b7185cbb44a941f5214b241a55e158f69b103f10214a05de7845f77e45",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "71bb69b7185cbb44a941f5214b241a55e158f69b103f10214a05de7845f77e45",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c452b84565cfc07c476694dd0fd389ed6d2b83619490b3c238f6bded438eddb1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "71bb69b7185cbb44a941f5214b241a55e158f69b103f10214a05de7845f77e45",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/8.10.6/ghc-8.10.6-x86_64-alpine-linux-integer-gmp.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "9abde42f1acb713d3423957c13af8c5e654f51126e66586f9b9c4df266c6c044",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "71bb69b7185cbb44a941f5214b241a55e158f69b103f10214a05de7845f77e45",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "c452b84565cfc07c476694dd0fd389ed6d2b83619490b3c238f6bded438eddb1",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "32ab41da04d56cae2297d6e45caa88180f99cec0e33f2756cfbc48c0c60b5721",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-unknown-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "268b9c0c55c70b0ebd7848c0e6c7f6c743b2f3082fb19f17b753c2536c354241",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "ff62f4a245c2427a1a5e6f5f1c2ad7521f69f9274a27ffb17c76f252ca573f3b",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "31f934423d7971b462eaa53cf87b15265d11420578c5a8a04304348cb90f1c13",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "31f934423d7971b462eaa53cf87b15265d11420578c5a8a04304348cb90f1c13",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "31f934423d7971b462eaa53cf87b15265d11420578c5a8a04304348cb90f1c13",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "31f934423d7971b462eaa53cf87b15265d11420578c5a8a04304348cb90f1c13",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "31f934423d7971b462eaa53cf87b15265d11420578c5a8a04304348cb90f1c13",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/8.10.6/ghc-8.10.6-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "f29974a67d76b64d0eb58603d60424c684a871e3107cebe45cf5b9b85f83b4c0",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "1ea27a7776e3cbd0881ecf2eb03eb5176e2cef177a12271a1c33417f4fa48a59",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "9e43fc3a39d2f2762262c63868653984e381e29eff6386f7325aad501b9190ad",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.6/ghc-8.10.6-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.6",
                            "dlHash": "d54de8306aa8b33afabf2ac94408e1f82c8e982a2a3346168c071b92bdb464c0",
                        },
                    },
                },
            },
        },
        "8.10.7": {
            "viTags": [
                "base-4.14.3.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/8.10.7/docs/html/users_guide/8.10.7-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-src.tar.xz",
                "dlSubdir": "ghc-8.10.7",
                "dlHash": "e3eef6229ce9908dfe1ea41436befb0455fefb1932559e860ad4c606b0d03c9d",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/8.10.7/ghc-8.10.7-testsuite.tar.xz",
                "dlSubdir": "ghc-8.10.7/testsuite",
                "dlHash": "df8627dc50b9182dec96085afeb005ccf5a0adc56c40340330a5df65de2b82fe",
            },
            "viPreCompile": "If you have autoconf >= 2.70 you'll need this patch https://gitlab.haskell.org/ghc/ghc/-/snippets/2040 (see the --patchdir option)",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "ced9870ea351af64fb48274b81a664cdb6a9266775f1598a79cbb6fdd5770a23",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "a13719bca87a0d3ac0c7d4157a4e60887009a7f1a8dbe95c4759ec413e086d30",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "a13719bca87a0d3ac0c7d4157a4e60887009a7f1a8dbe95c4759ec413e086d30",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6ed67049a23054a8042e65c9976d5e196e5ee4e83b29b2ee35c8a22ab1e5b73",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "ced9870ea351af64fb48274b81a664cdb6a9266775f1598a79cbb6fdd5770a23",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "ced9870ea351af64fb48274b81a664cdb6a9266775f1598a79cbb6fdd5770a23",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6ed67049a23054a8042e65c9976d5e196e5ee4e83b29b2ee35c8a22ab1e5b73",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6ed67049a23054a8042e65c9976d5e196e5ee4e83b29b2ee35c8a22ab1e5b73",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6ed67049a23054a8042e65c9976d5e196e5ee4e83b29b2ee35c8a22ab1e5b73",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "262a50bfb5b7c8770e0d99f54d42e5876968da7bf93e2e4d6cfe397891a36d05",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "262a50bfb5b7c8770e0d99f54d42e5876968da7bf93e2e4d6cfe397891a36d05",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6ed67049a23054a8042e65c9976d5e196e5ee4e83b29b2ee35c8a22ab1e5b73",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "262a50bfb5b7c8770e0d99f54d42e5876968da7bf93e2e4d6cfe397891a36d05",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/8.10.7/ghc-8.10.7-x86_64-alpine-linux-integer-gmp.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fa9fbb921fba5a9482ac009800be43f0fe42c60e54fab55ded9f2327d624cb6d",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "262a50bfb5b7c8770e0d99f54d42e5876968da7bf93e2e4d6cfe397891a36d05",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6ed67049a23054a8042e65c9976d5e196e5ee4e83b29b2ee35c8a22ab1e5b73",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "287db0f9c338c9f53123bfa8731b0996803ee50f6ee847fe388092e5e5132047",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-unknown-freebsd.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "45e35d24bc700e1093efa39189e9fa01498069881aed2fa8779c011941a80da1",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "b6515b0ea3f7a6e34d92e7fcd0c1fef50d6030fe8f46883000185289a4b8ea9a",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fbfc1ef194f4e7a4c0da8c11cc69b17458a4b928b609b3622c97acc4acd5c5ab",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fbfc1ef194f4e7a4c0da8c11cc69b17458a4b928b609b3622c97acc4acd5c5ab",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fbfc1ef194f4e7a4c0da8c11cc69b17458a4b928b609b3622c97acc4acd5c5ab",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fbfc1ef194f4e7a4c0da8c11cc69b17458a4b928b609b3622c97acc4acd5c5ab",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fbfc1ef194f4e7a4c0da8c11cc69b17458a4b928b609b3622c97acc4acd5c5ab",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/8.10.7/ghc-8.10.7-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "3110e6ee029d9d8062158b54b06f71a21b0fac87bf0e085f9be5bbcf73f99e6d",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "fad2417f9b295233bf8ade79c0e6140896359e87be46cb61cd1d35863d9d0e55",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "dc469fc3c35fd2a33a5a575ffce87f13de7b98c2d349a41002e200a56d9bba1c",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/8.10.7/ghc-8.10.7-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-8.10.7",
                            "dlHash": "3949c31bdf7d3b4afb765ea8246bca4ca9707c5d988d9961a244f0da100956a2",
                        },
                    },
                },
            },
        },
        "9.0.1": {
            "viTags": [
                "base-4.15.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.0.1/docs/html/users_guide/9.0.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-src.tar.xz",
                "dlSubdir": "ghc-9.0.1",
                "dlHash": "a5230314e4065f9fcc371dfe519748fd85c825b279abf72a24e09b83578a35f9",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.0.1/ghc-9.0.1-testsuite.tar.xz",
                "dlSubdir": "ghc-9.0.1/testsuite",
                "dlHash": "70a9049fc2a2c26274305b12dd20c27476f5e8995163614fe8b20292c6c62a86",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "4ca6252492f59fe589029fadca4b6f922d6a9f0ff39d19a2bd9886fde4e183d5",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "c253e7eb62cc9da6524c491c85ec8d3727c2ca6035a8653388e636aaa30a2a0f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "c253e7eb62cc9da6524c491c85ec8d3727c2ca6035a8653388e636aaa30a2a0f",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "1fb8e27eeec51b4cdbfd1b3c16727adc5f77388d3e925e63799d8232647f316d",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "4ca6252492f59fe589029fadca4b6f922d6a9f0ff39d19a2bd9886fde4e183d5",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "4ca6252492f59fe589029fadca4b6f922d6a9f0ff39d19a2bd9886fde4e183d5",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "1fb8e27eeec51b4cdbfd1b3c16727adc5f77388d3e925e63799d8232647f316d",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "1fb8e27eeec51b4cdbfd1b3c16727adc5f77388d3e925e63799d8232647f316d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "1fb8e27eeec51b4cdbfd1b3c16727adc5f77388d3e925e63799d8232647f316d",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "a23750950b6995a66ba59afe82bbc505bd3479d6ab59cf66f45bc6c056e4d87b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "a23750950b6995a66ba59afe82bbc505bd3479d6ab59cf66f45bc6c056e4d87b",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "1fb8e27eeec51b4cdbfd1b3c16727adc5f77388d3e925e63799d8232647f316d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "a23750950b6995a66ba59afe82bbc505bd3479d6ab59cf66f45bc6c056e4d87b",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.1/ghc-9.0.1-x86_64-alpine-linux-integer-gmp.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "33dd5221ead3c81711f2a21fbf97b411327c837f2d1b8753e2de5e6e63abb805",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "a23750950b6995a66ba59afe82bbc505bd3479d6ab59cf66f45bc6c056e4d87b",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "1fb8e27eeec51b4cdbfd1b3c16727adc5f77388d3e925e63799d8232647f316d",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "122d60509147d0117779d275f0215bde2ff63a64cda9d88f149432d0cae71b22",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "9dbc06d8832cae5c9f86dd7b2db729b3748a47beb4fd4b1e62bb66119817c3c1",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.0.1-x86_64-unknown-mingw32",
                            "dlHash": "4f4ab118df01cbc7e7c510096deca0cb25025339a97730de0466416296202493",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "880e37cea8328401bcfecfe4bb56eb85195f30135b140140b3f24094264f8ba5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "880e37cea8328401bcfecfe4bb56eb85195f30135b140140b3f24094264f8ba5",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "880e37cea8328401bcfecfe4bb56eb85195f30135b140140b3f24094264f8ba5",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "880e37cea8328401bcfecfe4bb56eb85195f30135b140140b3f24094264f8ba5",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "880e37cea8328401bcfecfe4bb56eb85195f30135b140140b3f24094264f8ba5",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.0.1/ghc-9.0.1-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "ebfeb3b91e6f2bb5a49fd3376746f7fd1b89e62e9838bf5b1530a8756ff1e6aa",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-aarch64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "fac7a0bdfc83c05df94024a2d67b8f00a9cd2733b9cb41fb8ad76be399014906",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.1/ghc-9.0.1-armv7-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.1",
                            "dlHash": "6f404f9b88468407b3a9ec5800bcc2d01dd453ef3d63414853b4fbbd4d8df496",
                        },
                    },
                },
            },
        },
        "9.0.2": {
            "viTags": [
                "base-4.15.1.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.0.2/docs/html/users_guide/9.0.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-src.tar.xz",
                "dlSubdir": "ghc-9.0.2",
                "dlHash": "140e42b96346322d1a39eb17602bcdc76e292028ad4a69286b230bab188a9197",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.0.2/ghc-9.0.2-testsuite.tar.xz",
                "dlSubdir": "ghc-9.0.2/testsuite",
                "dlHash": "7a6c70782d755ab09cad69ecf7e5d539f035dd78eaf4fe50b4c9ca4732fcaed4",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "026257de3443017acf1ab5b7301e902331d8239f066babbe546067f6d6201763",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "a33263c3f819de606da079d191ddc3b86cbf503a14c6c0eec1a4ae1899008fdc",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "a33263c3f819de606da079d191ddc3b86cbf503a14c6c0eec1a4ae1899008fdc",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "026257de3443017acf1ab5b7301e902331d8239f066babbe546067f6d6201763",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "026257de3443017acf1ab5b7301e902331d8239f066babbe546067f6d6201763",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "42c78fa5ca8eb2bc7fabb8b9d7634d5b0ddd81c7fe16d8e212aeb9dac91a4f4e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "42c78fa5ca8eb2bc7fabb8b9d7634d5b0ddd81c7fe16d8e212aeb9dac91a4f4e",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "42c78fa5ca8eb2bc7fabb8b9d7634d5b0ddd81c7fe16d8e212aeb9dac91a4f4e",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.0.2/ghc-9.0.2-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.0.2-x86_64-unknown-linux",
                            "dlHash": "02a883f0198aeca63d9361f1e887c2092842547892434686e092fff79ce7fb44",
                        },
                    },
                    "Linux_AmazonLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "42c78fa5ca8eb2bc7fabb8b9d7634d5b0ddd81c7fe16d8e212aeb9dac91a4f4e",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.0.2/ghc-9.0.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.0.2-x86_64-apple-darwin",
                            "dlHash": "575dc47274c251e2585b8d84d597cbd55919b4393b72f5de0c639a867e0ac197",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "1c8057803e3d8dcb86b5e36a1cfcad15d95bdf6a202f4ac614aea5952d34673d",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.0.2-x86_64-unknown-mingw32",
                            "dlHash": "f6fbb8047ae16049dc6215a6abb652b4307205310bfffddea695a854af92dc99",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "0a4cc87cd241d37727fae053c02bab20ddaf94cea4c28f4522cca0e9e5d9741c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "0a4cc87cd241d37727fae053c02bab20ddaf94cea4c28f4522cca0e9e5d9741c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "0a4cc87cd241d37727fae053c02bab20ddaf94cea4c28f4522cca0e9e5d9741c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "0a4cc87cd241d37727fae053c02bab20ddaf94cea4c28f4522cca0e9e5d9741c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "0a4cc87cd241d37727fae053c02bab20ddaf94cea4c28f4522cca0e9e5d9741c",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.0.2/ghc-9.0.2-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "13d00eacd9a9fdc3453f3cfa43a79ea6ab88746f20622dd50e2c1f4db34c06c9",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.0.2/ghc-9.0.2-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.0.2",
                            "dlHash": "cb016344c70a872738a24af60bd15d3b18749087b9905c1b3f1b1549dc01f46d",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.0.2/ghc-9.0.2-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.0.2-aarch64-apple-darwin",
                            "dlHash": "5aa983c3bb4ef905860ea3889b77443b0e9e851b64a6e9acf17272b73178d49c",
                        },
                    },
                },
            },
        },
        "9.2.1": {
            "viTags": [
                "old",
                "base-4.16.0.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.1/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-src.tar.xz",
                "dlSubdir": "ghc-9.2.1",
                "dlHash": "f444012f97a136d9940f77cdff03fda48f9475e2ed0fec966c4d35c4df55f746",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.2.1/ghc-9.2.1-testsuite.tar.xz",
                "dlSubdir": "ghc-9.2.1/testsuite",
                "dlHash": "0402066000db81781b343976f1a274e54ebb117d599da1a979ccb0b99ab782cd",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "f09133ed735e9f3b221b5ed54787e5651f039ed0f7dab0ab834a27c8ca68fc9b",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "53f1650ed092230480ff5750b94f409e5dfe66bd07ced00bbbcdf5d6b180234c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "53f1650ed092230480ff5750b94f409e5dfe66bd07ced00bbbcdf5d6b180234c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "e37cd1fe64006dd42f418dacbae3fea0938ce0905407cfc7c3ea61054f5d5329",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "f09133ed735e9f3b221b5ed54787e5651f039ed0f7dab0ab834a27c8ca68fc9b",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "f09133ed735e9f3b221b5ed54787e5651f039ed0f7dab0ab834a27c8ca68fc9b",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "e37cd1fe64006dd42f418dacbae3fea0938ce0905407cfc7c3ea61054f5d5329",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "e37cd1fe64006dd42f418dacbae3fea0938ce0905407cfc7c3ea61054f5d5329",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "e37cd1fe64006dd42f418dacbae3fea0938ce0905407cfc7c3ea61054f5d5329",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "4b67324507f5d14c23db3ed83c57f4e25d877e97d2b93cfe8e1a9fdf65e4efa1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "4b67324507f5d14c23db3ed83c57f4e25d877e97d2b93cfe8e1a9fdf65e4efa1",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "e37cd1fe64006dd42f418dacbae3fea0938ce0905407cfc7c3ea61054f5d5329",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "4b67324507f5d14c23db3ed83c57f4e25d877e97d2b93cfe8e1a9fdf65e4efa1",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "e37cd1fe64006dd42f418dacbae3fea0938ce0905407cfc7c3ea61054f5d5329",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.1-x86_64-apple-darwin",
                            "dlHash": "73a3c605be4622928289eb7d2eeca2b00c0b1c9a8dec8ded1938b7f03a7d2deb",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.1-x86_64-unknown-mingw32",
                            "dlHash": "649e04abd4fa35796070b35de1c353721507a49842b18663aa1c7adc6b4115d8",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.1-x86_64-unknown-linux",
                            "dlHash": "afe4f069057b5c3d52d9088b4a996eaeac379c01c0e16fbfca94ac463e7dae75",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-i386-unknown-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1-i386-unknown-linux",
                            "dlHash": "4b61f074d14c2b18acaf296efd54421ab17bf6c771d10f7bf0f6eeef519f330c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-i386-unknown-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1-i386-unknown-linux",
                            "dlHash": "4b61f074d14c2b18acaf296efd54421ab17bf6c771d10f7bf0f6eeef519f330c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-i386-unknown-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1-i386-unknown-linux",
                            "dlHash": "4b61f074d14c2b18acaf296efd54421ab17bf6c771d10f7bf0f6eeef519f330c",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-i386-unknown-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1-i386-unknown-linux",
                            "dlHash": "4b61f074d14c2b18acaf296efd54421ab17bf6c771d10f7bf0f6eeef519f330c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-i386-unknown-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1-i386-unknown-linux",
                            "dlHash": "4b61f074d14c2b18acaf296efd54421ab17bf6c771d10f7bf0f6eeef519f330c",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-i386-unknown-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1-i386-unknown-linux",
                            "dlHash": "4b61f074d14c2b18acaf296efd54421ab17bf6c771d10f7bf0f6eeef519f330c",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.1/ghc-9.2.1-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "717d4246a8b407a807048ce6eddb2785aca2e4c73b6b634c01e1726f42d539a1",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.1/ghc-9.2.1-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.1-aarch64-apple-darwin",
                            "dlHash": "c91dd5807267b25dcf3c04afafd0bb457ec64c72da8e978a441b0a1790a51af1",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.1/ghc-9.2.1-armv7-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.2.1",
                            "dlHash": "3bde9deeb6969ff0f5aea566d2602edc57f5f3ca158b4c03f039c44d8c51ea0f",
                        },
                    },
                },
            },
        },
        "9.2.2": {
            "viTags": [
                "base-4.16.1.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.2/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-src.tar.xz",
                "dlSubdir": "ghc-9.2.2",
                "dlHash": "902463a4cc6ee479af9358b9f8b2ee3237b03e934a1ea65b6d1fcf3e0d749ea6",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.2.2/ghc-9.2.2-testsuite.tar.xz",
                "dlSubdir": "ghc-9.2.2/testsuite",
                "dlHash": "2a0a15bbc4fd89611907ef891e83cc1d2375eb0b5566d94965dffa008e861cb2",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "91052766a8bec6a1a8529eda9ff587ce821a071cf52705e1b8caa3d38d3913f4",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "fb61dea556a2023dc2d50ee61a22144bb23e4229a378e533065124c218f40cfc",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "fb61dea556a2023dc2d50ee61a22144bb23e4229a378e533065124c218f40cfc",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "eab2b4e3ca99eb7cc81aa3136e9e0b245ba6b3e9057f02a2d289fbf60856eb10",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "91052766a8bec6a1a8529eda9ff587ce821a071cf52705e1b8caa3d38d3913f4",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "91052766a8bec6a1a8529eda9ff587ce821a071cf52705e1b8caa3d38d3913f4",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "eab2b4e3ca99eb7cc81aa3136e9e0b245ba6b3e9057f02a2d289fbf60856eb10",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "eab2b4e3ca99eb7cc81aa3136e9e0b245ba6b3e9057f02a2d289fbf60856eb10",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "eab2b4e3ca99eb7cc81aa3136e9e0b245ba6b3e9057f02a2d289fbf60856eb10",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "5100aa7dea87aaf2ed596be83c93165d7199492f6db431d874fcfa07e8ac76ab",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "5100aa7dea87aaf2ed596be83c93165d7199492f6db431d874fcfa07e8ac76ab",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "eab2b4e3ca99eb7cc81aa3136e9e0b245ba6b3e9057f02a2d289fbf60856eb10",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "5100aa7dea87aaf2ed596be83c93165d7199492f6db431d874fcfa07e8ac76ab",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "eab2b4e3ca99eb7cc81aa3136e9e0b245ba6b3e9057f02a2d289fbf60856eb10",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.2/ghc-9.2.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.2-x86_64-apple-darwin",
                            "dlHash": "1f9d07743f74fc1ce9cca078d807d44bc3d0c1f76f2d50a1a4ffdcdd5a9c3219",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.2/ghc-9.2.2-x86_64-unknown-mingw32.tar.gz",
                            "dlSubdir": "ghc-9.2.2-x86_64-unknown-mingw32",
                            "dlHash": "666de668f037b823a8585586cbeff337fcf5847c001cbed796735fd77e06f113",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.2/ghc-9.2.2-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.2-x86_64-unknown-linux",
                            "dlHash": "9b72f363c1c56e4722b0cb4113cb7edbce4fec37a34e440b30de433b7163590f",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "24234486ed4508161c6f88f4750a36d38b135b0c6e5fe78efe2d85c612ecaf9e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "24234486ed4508161c6f88f4750a36d38b135b0c6e5fe78efe2d85c612ecaf9e",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "24234486ed4508161c6f88f4750a36d38b135b0c6e5fe78efe2d85c612ecaf9e",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "24234486ed4508161c6f88f4750a36d38b135b0c6e5fe78efe2d85c612ecaf9e",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "24234486ed4508161c6f88f4750a36d38b135b0c6e5fe78efe2d85c612ecaf9e",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.2/ghc-9.2.2-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "f3621ccba7ae48fcd67a9505f61bb5ccfb05c4cbfecd5a6ea65fe3f150af0e98",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.2.2/ghc-9.2.2-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.2-aarch64-apple-darwin",
                            "dlHash": "0d5525f551c601422d30a973fbd03e9a284c480a3914fbd82d62084c3dd2e2a9",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.2/ghc-9.2.2-armv7-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.2",
                            "dlHash": "91dd2bc86faf6aa751f30b27d691203ebdf6ecdf03ebf14a3356ceb4c60af4d9",
                        },
                    },
                },
            },
        },
        "9.2.3": {
            "viTags": [
                "base-4.16.2.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.3/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-src-booted.tar.xz",
                "dlSubdir": "ghc-9.2.3",
                "dlHash": "00e33a2640e64014fcef4e385f661f61c47839755054a2f87ffe4d5a58c6cdaa",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.2.3/ghc-9.2.3-testsuite.tar.xz",
                "dlSubdir": "ghc-9.2.3/testsuite",
                "dlHash": "46a6cbb0c32f6b4d965db667ec9a59d2feaf9e31609e0cdbe57e61af337d3e20",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "7a3198fff8ae59abe071103dbf4a55d595fe79e93e47d4e22f605097ae1402f1",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "6cfe876a334443438dbe47079ddf9c3b0768c7b3af5ce9cdb1dee7e72497f4f5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "6cfe876a334443438dbe47079ddf9c3b0768c7b3af5ce9cdb1dee7e72497f4f5",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "1d86fe94eadbe2f4a61632a9b6f4314ff531a00be44b88765bb2281f4aacac51",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "7a3198fff8ae59abe071103dbf4a55d595fe79e93e47d4e22f605097ae1402f1",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "7a3198fff8ae59abe071103dbf4a55d595fe79e93e47d4e22f605097ae1402f1",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "1d86fe94eadbe2f4a61632a9b6f4314ff531a00be44b88765bb2281f4aacac51",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "1d86fe94eadbe2f4a61632a9b6f4314ff531a00be44b88765bb2281f4aacac51",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "1d86fe94eadbe2f4a61632a9b6f4314ff531a00be44b88765bb2281f4aacac51",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "c2c9e171c205922a7c80e4b43e0432ebdb857076453f969dfda3ba9844aa5f5d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "c2c9e171c205922a7c80e4b43e0432ebdb857076453f969dfda3ba9844aa5f5d",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "1d86fe94eadbe2f4a61632a9b6f4314ff531a00be44b88765bb2281f4aacac51",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "c2c9e171c205922a7c80e4b43e0432ebdb857076453f969dfda3ba9844aa5f5d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "1d86fe94eadbe2f4a61632a9b6f4314ff531a00be44b88765bb2281f4aacac51",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.3-x86_64-apple-darwin",
                            "dlHash": "42f2d4e384a21956e806bcf8745ed436f799e5eca28839dfb81dd3dc7895ca41",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "bfda1d5bb64315bb9e1ebb45ac953c18a8768f588b92d557baca29c319c4688a",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.3-x86_64-unknown-mingw32",
                            "dlHash": "0543d80c1ef453a5f82d0a2bc436f93d2feb3d5855114c8a78a12c561c9bc8df",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.3-x86_64-unknown-linux",
                            "dlHash": "4ed9e3510de06e0902da130d5e1a388c5c3f151423a8c82cc4a6b22d449d4e51",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "5730ee787cda39b9642d7963107a323248ff26d3531cb2c23e03631d3cd5f4ad",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "5730ee787cda39b9642d7963107a323248ff26d3531cb2c23e03631d3cd5f4ad",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "5730ee787cda39b9642d7963107a323248ff26d3531cb2c23e03631d3cd5f4ad",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "5730ee787cda39b9642d7963107a323248ff26d3531cb2c23e03631d3cd5f4ad",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "5730ee787cda39b9642d7963107a323248ff26d3531cb2c23e03631d3cd5f4ad",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.3",
                            "dlHash": "4b0b3848606ca83923b666dc8325df6a93986682c57b2865a44c52795a30f808",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.3/ghc-9.2.3-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.3-aarch64-apple-darwin",
                            "dlHash": "56a03022703e4305020a267105bd5ebfb1bcb8e7eed33261b3987f79445bcc3a",
                        },
                    },
                },
            },
        },
        "9.2.4": {
            "viTags": [
                "base-4.16.3.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.4/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-src.tar.xz",
                "dlSubdir": "ghc-9.2.4",
                "dlHash": "15213888064a0ec4e7723d075f31b87a678ce0851773d58b44ef7aa3de996458",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.2.4/ghc-9.2.4-testsuite.tar.xz",
                "dlSubdir": "ghc-9.2.4/testsuite",
                "dlHash": "d58693ac3d1bc7f020c5dfd92c10f63113dc5d6fd8cc789394aafb42a97eb02d",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "e6eccc65a3dded27291c3f80cce18b1e51fd64e92bad7556142020f0ffe3f7aa",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "a77a91a39d9b0167124b7e97648b2b52973ae0978cb259e0d44f0752a75037cb",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "a77a91a39d9b0167124b7e97648b2b52973ae0978cb259e0d44f0752a75037cb",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "3fdda484dc1054b27bb75975c379d4a7fdaff59c969098c807dad87d4bc91626",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "e6eccc65a3dded27291c3f80cce18b1e51fd64e92bad7556142020f0ffe3f7aa",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "e6eccc65a3dded27291c3f80cce18b1e51fd64e92bad7556142020f0ffe3f7aa",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "3fdda484dc1054b27bb75975c379d4a7fdaff59c969098c807dad87d4bc91626",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "3fdda484dc1054b27bb75975c379d4a7fdaff59c969098c807dad87d4bc91626",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "3fdda484dc1054b27bb75975c379d4a7fdaff59c969098c807dad87d4bc91626",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "540d3a8ddcf6175efeeec54a73893526a6acf464825f7d3d7a396158fc3f6928",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "540d3a8ddcf6175efeeec54a73893526a6acf464825f7d3d7a396158fc3f6928",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "3fdda484dc1054b27bb75975c379d4a7fdaff59c969098c807dad87d4bc91626",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "540d3a8ddcf6175efeeec54a73893526a6acf464825f7d3d7a396158fc3f6928",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "3fdda484dc1054b27bb75975c379d4a7fdaff59c969098c807dad87d4bc91626",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.4-x86_64-apple-darwin",
                            "dlHash": "f2e8366fd3754dd9388510792aba2d2abecb1c2f7f1e5555f6065c3c5e2ffec4",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "d462447a57f032291864ef78a7f826a07b17af76392b9a15dc0a672c9bc2d024",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.4-x86_64-unknown-mingw32",
                            "dlHash": "6dc0e79a37510905074bcf7e8af9014bd5f899791a6739876ef703de9011e0e6",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.4-x86_64-unknown-linux",
                            "dlHash": "026348947d30a156b84de5d6afeaa48fdcb2795b47954cd8341db00d3263a481",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "5dc1eb9c65f01b1e5c5693af72af07a4e9e75c6920e620fd598daeefa804487a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "5dc1eb9c65f01b1e5c5693af72af07a4e9e75c6920e620fd598daeefa804487a",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "5dc1eb9c65f01b1e5c5693af72af07a4e9e75c6920e620fd598daeefa804487a",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "5dc1eb9c65f01b1e5c5693af72af07a4e9e75c6920e620fd598daeefa804487a",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "5dc1eb9c65f01b1e5c5693af72af07a4e9e75c6920e620fd598daeefa804487a",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.4",
                            "dlHash": "fc7dbc6bae36ea5ac30b7e9a263b7e5be3b45b0eb3e893ad0bc2c950a61f14ec",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.4/ghc-9.2.4-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.4-aarch64-apple-darwin",
                            "dlHash": "8cf8408544a1a43adf1bbbb0dd6b074efadffc68bfa1a792947c52e825171224",
                        },
                    },
                },
            },
        },
        "9.2.5": {
            "viTags": [
                "base-4.16.4.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.5/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-src.tar.xz",
                "dlSubdir": "ghc-9.2.5",
                "dlHash": "0606797d1b38e2d88ee2243f38ec6b9a1aa93e9b578e95f0de9a9c0a4144021c",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.2.5/ghc-9.2.5-testsuite.tar.xz",
                "dlSubdir": "ghc-9.2.5/testsuite",
                "dlHash": "748474e6e095297fc13d1e572302a2f3175a9f0659d43d8ae74ac6dc22040aa6",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "2d115b7258751f0e4481e35b5953ca3c7870e8ec9ce68f1d32fc014ddc29b2a5",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "89f2df47d86a45593d6ba3fd3a44b627d100588cd59be257570dbe3f92b17c48",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "89f2df47d86a45593d6ba3fd3a44b627d100588cd59be257570dbe3f92b17c48",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "5bf47d6eb9332d76098669623668836d8e44c7d67c1bc0a954332e8385735fe7",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "2d115b7258751f0e4481e35b5953ca3c7870e8ec9ce68f1d32fc014ddc29b2a5",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "2d115b7258751f0e4481e35b5953ca3c7870e8ec9ce68f1d32fc014ddc29b2a5",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "5bf47d6eb9332d76098669623668836d8e44c7d67c1bc0a954332e8385735fe7",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "5bf47d6eb9332d76098669623668836d8e44c7d67c1bc0a954332e8385735fe7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "5bf47d6eb9332d76098669623668836d8e44c7d67c1bc0a954332e8385735fe7",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "07c02710ac691a15c4b62e097b98862179fef21fb0bd3bd1e737eaed5831d2fa",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "07c02710ac691a15c4b62e097b98862179fef21fb0bd3bd1e737eaed5831d2fa",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "5bf47d6eb9332d76098669623668836d8e44c7d67c1bc0a954332e8385735fe7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "07c02710ac691a15c4b62e097b98862179fef21fb0bd3bd1e737eaed5831d2fa",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "5bf47d6eb9332d76098669623668836d8e44c7d67c1bc0a954332e8385735fe7",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.5-x86_64-apple-darwin",
                            "dlHash": "6c46f5003f29d09802d572a7c5fabf6c1f91714a474967a5415b15df77fdcd90",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "add95df67d743f65737237afa2c6589b2d2e1192771ee5082ce84b9716ef29da",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.5-x86_64-unknown-mingw32",
                            "dlHash": "a6815804606ef2d99250078d5c1315b74bb5718d8f15a629f211bcd37bad07c3",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.5-x86_64-unknown-linux",
                            "dlHash": "ef35f3b68abcde11ebeb2e1d42e48b2c1d189e27d951abdda678bb0492fae2b8",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "cf2088010e4477cb84b26725107eeb23e878368074abcf04f089d498ca2d9ddf",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "cf2088010e4477cb84b26725107eeb23e878368074abcf04f089d498ca2d9ddf",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "cf2088010e4477cb84b26725107eeb23e878368074abcf04f089d498ca2d9ddf",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "cf2088010e4477cb84b26725107eeb23e878368074abcf04f089d498ca2d9ddf",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "cf2088010e4477cb84b26725107eeb23e878368074abcf04f089d498ca2d9ddf",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.5",
                            "dlHash": "29c0735ada90cdbf7e4a227dee08f18d74e33ec05d7c681e4ef95b8aa13104b3",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.5/ghc-9.2.5-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.5-aarch64-apple-darwin",
                            "dlHash": "b060ad093e0d86573e01b3d1fd622d4892f8d8925cbb7d75a67a01d2a4f27f18",
                        },
                    },
                },
            },
        },
        "9.2.6": {
            "viTags": [
                "base-4.16.4.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.6/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-src.tar.xz",
                "dlSubdir": "ghc-9.2.6",
                "dlHash": "7a54cf0398ad488b4ed219e15d1d1e64c0b6876c43a0564550dd11f0540d7305",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "a2799409be6a1f5dbb9382b0b1b70d406567b3f6592c6a4f795d8b0b1ae6d4a1",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "85b3eaf0522781244aa7618ee285713a82cab00e21d29ea99159cf69352e2bcb",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "85b3eaf0522781244aa7618ee285713a82cab00e21d29ea99159cf69352e2bcb",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "a2799409be6a1f5dbb9382b0b1b70d406567b3f6592c6a4f795d8b0b1ae6d4a1",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.6/ghc-9.2.6-x86_64-ubuntu20.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "103789e3c710e7814d3cfe734901d40e27cda1f080dec543b55c792d2e8f3866",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "a2799409be6a1f5dbb9382b0b1b70d406567b3f6592c6a4f795d8b0b1ae6d4a1",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.6/ghc-9.2.6-x86_64-ubuntu20.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "103789e3c710e7814d3cfe734901d40e27cda1f080dec543b55c792d2e8f3866",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "f3adc19fe933188481b8dc3d62842a47832cb63ceb7e5a70424f28c9ff9915d5",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "b7334f002e56588129a04a43559901fcd875b95c194a8bee5fa5f498ea002219",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "b7334f002e56588129a04a43559901fcd875b95c194a8bee5fa5f498ea002219",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "f3adc19fe933188481b8dc3d62842a47832cb63ceb7e5a70424f28c9ff9915d5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "b7334f002e56588129a04a43559901fcd875b95c194a8bee5fa5f498ea002219",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "f3adc19fe933188481b8dc3d62842a47832cb63ceb7e5a70424f28c9ff9915d5",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.6-x86_64-apple-darwin",
                            "dlHash": "37f59e129d65a8c331e1aff8abda4d52e1694bb2d29c68d60fced45776f93d62",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.6-x86_64-unknown-mingw32",
                            "dlHash": "bd13aadeeadb3454199eb797961350f0a19275ec74002b2816d1b63093dfd55f",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.6-x86_64-unknown-linux",
                            "dlHash": "4bbd45c59365608fffc9a103bff5be9fdc79a06014f4b19154cb7ea66d34830f",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.2.6/ghc-9.2.6-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.2.6-x86_64-portbld-freebsd",
                            "dlHash": "57fbb931a36bcbc0d6227a6cf5fcf716a8259bde6b8f432364ac05a528f8413f",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "02040f53149322279472a0a3ee0bf398e4d9377f6b9484dbf4a83fef7e6d51a8",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "02040f53149322279472a0a3ee0bf398e4d9377f6b9484dbf4a83fef7e6d51a8",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "02040f53149322279472a0a3ee0bf398e4d9377f6b9484dbf4a83fef7e6d51a8",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "02040f53149322279472a0a3ee0bf398e4d9377f6b9484dbf4a83fef7e6d51a8",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "02040f53149322279472a0a3ee0bf398e4d9377f6b9484dbf4a83fef7e6d51a8",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.6",
                            "dlHash": "824635dc779415bdcd20c4ef432e683a10d0a6c64dedca3441b434a60d0944f1",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.6/ghc-9.2.6-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.6-aarch64-apple-darwin",
                            "dlHash": "68e54fd1af808395584e73b6a9a5b6c7dd85d451da00429aa124a821f4e96ad0",
                        },
                    },
                },
            },
        },
        "9.2.7": {
            "viTags": [
                "base-4.16.4.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.7/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-src.tar.xz",
                "dlSubdir": "ghc-9.2.7",
                "dlHash": "a253567a17b734a4c0dd0ffa296d33c2a5b5a54a77df988806a2a1e1ca7e88b8",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "d57b7df77ed80b7a37601c6b99a9458f9d1e937f3ec91b1454bb88a70302919a",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "3a76ad6b96915eebf960d1b757ee57341302a76c6a8f97af63fd84eddb45362b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "3a76ad6b96915eebf960d1b757ee57341302a76c6a8f97af63fd84eddb45362b",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "d57b7df77ed80b7a37601c6b99a9458f9d1e937f3ec91b1454bb88a70302919a",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.7/ghc-9.2.7-x86_64-ubuntu20.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "b74d8d1afd181dd48ba81a2e8991c01281975b7a25791a0504835d049ae416c3",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "d57b7df77ed80b7a37601c6b99a9458f9d1e937f3ec91b1454bb88a70302919a",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.7/ghc-9.2.7-x86_64-ubuntu20.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "b74d8d1afd181dd48ba81a2e8991c01281975b7a25791a0504835d049ae416c3",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "f38a62b4e4f6b55bf819113b98284e084f190a6c8dc23d8313aa7d895045a0a6",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "b4db141559b9e9df18ead9647447016ea29d55e306ab6eb4a612ef2493ef8871",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "b4db141559b9e9df18ead9647447016ea29d55e306ab6eb4a612ef2493ef8871",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "f38a62b4e4f6b55bf819113b98284e084f190a6c8dc23d8313aa7d895045a0a6",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "b4db141559b9e9df18ead9647447016ea29d55e306ab6eb4a612ef2493ef8871",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "f38a62b4e4f6b55bf819113b98284e084f190a6c8dc23d8313aa7d895045a0a6",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.7-x86_64-apple-darwin",
                            "dlHash": "9ab3bc98e32978d555b9ee8cb5996ead330fdcb530575788eb1c12c67441f975",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.2.7/ghc-9.2.7-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.2.7-x86_64-portbld-freebsd",
                            "dlHash": "006aa69e5c7309ed599549f392797be3e7f22d86728db86ec3dd3464f1b7fd99",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.7-x86_64-unknown-mingw32",
                            "dlHash": "30b9545a18eeb509dac427415fa1c45c264e09ec6ab0e93c8ec48742cbb90f24",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-x86_64-alpine3.12-linux-gmp.tar.xz",
                            "dlSubdir": "ghc-9.2.7-x86_64-unknown-linux",
                            "dlHash": "0d506e3b12728bba25a729b00de755710e9710292f37d56a227d5374e8225aa6",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "02d63c411dba82ae46ae9d7e775057d0de36a5da27791809bf9d9750a824b0bd",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "02d63c411dba82ae46ae9d7e775057d0de36a5da27791809bf9d9750a824b0bd",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "02d63c411dba82ae46ae9d7e775057d0de36a5da27791809bf9d9750a824b0bd",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "02d63c411dba82ae46ae9d7e775057d0de36a5da27791809bf9d9750a824b0bd",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "02d63c411dba82ae46ae9d7e775057d0de36a5da27791809bf9d9750a824b0bd",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.7",
                            "dlHash": "b4829dd2f4bdaa4b21b22b50edec17616848ab22ab64188047a3eb12bb4da85a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.7/ghc-9.2.7-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.7-aarch64-apple-darwin",
                            "dlHash": "a4b63dad502e45da4c65d5255844868eed6bc9157b63fe3fd920f4efb82bb11e",
                        },
                    },
                },
            },
        },
        "9.2.8": {
            "viTags": [
                "base-4.16.4.0",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.2.8/docs/html/users_guide/index.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-src.tar.xz",
                "dlSubdir": "ghc-9.2.8",
                "dlHash": "5f13d1786bf4fd12f4b45faa37abedb5bb3f36d5e58f7da5307e8bfe88a567a1",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "2b0d865a507fe3bb2c24c31e193436a79d58c857a0f7bf7e4dbfe990c9169275",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "10d1be25487bcf99ac8eb77beaa220c85e69f8c1106f4219ce019206ecc0ac51",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "10d1be25487bcf99ac8eb77beaa220c85e69f8c1106f4219ce019206ecc0ac51",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "2b0d865a507fe3bb2c24c31e193436a79d58c857a0f7bf7e4dbfe990c9169275",
                        },
                        "( >= 20 && < 24)": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.8/ghc-9.2.8-x86_64-ubuntu20.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "6e4adc184a53ca9d9dd8c11c6611d0643fdc3b76550ae769e378d9edb2bda745",
                        },
                        ">= 24": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.8/ghc-9.2.8-x86_64-ubuntu24.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8-x86_64-unknown-linux",
                            "dlHash": "a66077e802bbc40d9f567dce25c7ef14c6b4747d5e84671be450fd7e8e0beb5c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.8/ghc-9.2.8-x86_64-ubuntu24.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8-x86_64-unknown-linux",
                            "dlHash": "a66077e802bbc40d9f567dce25c7ef14c6b4747d5e84671be450fd7e8e0beb5c",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "2b0d865a507fe3bb2c24c31e193436a79d58c857a0f7bf7e4dbfe990c9169275",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/ghc/9.2.8/ghc-9.2.8-x86_64-ubuntu20.04-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "6e4adc184a53ca9d9dd8c11c6611d0643fdc3b76550ae769e378d9edb2bda745",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "845f63cd365317bb764d81025554a2527dbe315d6fa268c9859e21b911bf2d3c",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "70c3ecbc6457f67ba0e76bd0ca2500bd0edd8262d3236a23422fad7602efa672",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "70c3ecbc6457f67ba0e76bd0ca2500bd0edd8262d3236a23422fad7602efa672",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "845f63cd365317bb764d81025554a2527dbe315d6fa268c9859e21b911bf2d3c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "70c3ecbc6457f67ba0e76bd0ca2500bd0edd8262d3236a23422fad7602efa672",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "845f63cd365317bb764d81025554a2527dbe315d6fa268c9859e21b911bf2d3c",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.8-x86_64-apple-darwin",
                            "dlHash": "eb78361feaf4277f627cbdc4b849849d09d175d0d878d28433719b7482db27f5",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.8/ghc-9.2.8-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.2.8-x86_64-portbld-freebsd",
                            "dlHash": "59bec40629caff7fcabee3edd2950e73656593511ea604c69ccd10e97d789d65",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.2.8-x86_64-unknown-mingw32",
                            "dlHash": "f11c7270839c50fda44f98b54254ae50340bb58b04f8d81ebcbe67a2827bd511",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.8/ghc-9.2.8-x86_64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8-x86_64-unknown-linux",
                            "dlHash": "1356ac4567999f6ae32471555bbe11e807a01ee9f5d4009c1486a660adbc7c3d",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "8e1261e5d3f9b2074af270f7ffb3d4714d878d4121a733a3d0a12ae715f3d9ee",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "8e1261e5d3f9b2074af270f7ffb3d4714d878d4121a733a3d0a12ae715f3d9ee",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "8e1261e5d3f9b2074af270f7ffb3d4714d878d4121a733a3d0a12ae715f3d9ee",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "8e1261e5d3f9b2074af270f7ffb3d4714d878d4121a733a3d0a12ae715f3d9ee",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "8e1261e5d3f9b2074af270f7ffb3d4714d878d4121a733a3d0a12ae715f3d9ee",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.8/ghc-9.2.8-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8-i386-unknown-linux",
                            "dlHash": "9ad3335d675f5fc4774f8fdd6301fc007b3240a0e2e257fa291bb2b404f5f9a9",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.2.8",
                            "dlHash": "645433359d8ad9e7b286f85ef5111db1b787ee3712c24c5dfde7c62769aa59a4",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.2.8/ghc-9.2.8-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.2.8-aarch64-apple-darwin",
                            "dlHash": "34db9b19571905b08ca1e444b46490e7c19cb73a0fe778696fa6ec02ff8d3c4b",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.2.8/ghc-9.2.8-armv7-deb10-linux-gnueabihf.tar.xz",
                            "dlSubdir": "ghc-9.2.8-armv7-linux-gnueabihf",
                            "dlHash": "d8926744e542a89f150635fdb2d0234c715e39caface4dcb2f0f989c96af51f1",
                        },
                    },
                },
            },
        },
        "9.4.1": {
            "viTags": [
                "base-4.17.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.1/docs/users_guide/9.4.1-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-src.tar.xz",
                "dlSubdir": "ghc-9.4.1",
                "dlHash": "cbfed4640bdf025e33ba55433daf8cdf698f4e0499ae7a800dde44a82e7396e3",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.1/ghc-9.4.1-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.1/testsuite",
                "dlHash": "5247cc788d43f2d26b58f63fed356d2f95555954ecab295383486e42d180d8a5",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "3bfd5c5c7d75cb3409cf037c5e1616b10a1bf9409930b00f237fdb5c1f5a534a",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "dcbff828b14a59d01d3fda68bb01b9cbc3a321a0c013905f436df5627128aa58",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "6d723a92883f122c232aaa7a087a55d39784f493131ff12c29eebc54bf3cfe06",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "6d723a92883f122c232aaa7a087a55d39784f493131ff12c29eebc54bf3cfe06",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "dcbff828b14a59d01d3fda68bb01b9cbc3a321a0c013905f436df5627128aa58",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "3bfd5c5c7d75cb3409cf037c5e1616b10a1bf9409930b00f237fdb5c1f5a534a",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "3bfd5c5c7d75cb3409cf037c5e1616b10a1bf9409930b00f237fdb5c1f5a534a",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "dcbff828b14a59d01d3fda68bb01b9cbc3a321a0c013905f436df5627128aa58",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "2ac415621849c32a400d69af059a3bb1cfa852c1427be6733540f0f7ad2a7470",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "2ac415621849c32a400d69af059a3bb1cfa852c1427be6733540f0f7ad2a7470",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "efe05368d6367ce9109c7607a0945d85273cc95a730dd17f23d8ae79ee3524ea",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "2ac415621849c32a400d69af059a3bb1cfa852c1427be6733540f0f7ad2a7470",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "dcbff828b14a59d01d3fda68bb01b9cbc3a321a0c013905f436df5627128aa58",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "2ac415621849c32a400d69af059a3bb1cfa852c1427be6733540f0f7ad2a7470",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "efe05368d6367ce9109c7607a0945d85273cc95a730dd17f23d8ae79ee3524ea",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.4.1/ghc-9.4.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-apple-darwin",
                            "dlHash": "d2c89eb1e989ee9cee890eda8981b248f5979903ae26058935fd9b95997305d6",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-mingw32",
                            "dlHash": "fdc2d78b8a978e712a4edcc1628e36a36be736d8202107d2d61999ac7a9dc5d0",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                            "dlSubdir": "ghc-9.4.1-x86_64-unknown-linux",
                            "dlHash": "6f552083f36576699af17c37c0ab78f95e6dcda77658531f2ca803637e2f0db9",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-i386-unknown-linux",
                            "dlHash": "2b03ab4df4e8a6b093b07e3c5687c1b1c67cab572403c23b0565ce497867aad7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-i386-unknown-linux",
                            "dlHash": "2b03ab4df4e8a6b093b07e3c5687c1b1c67cab572403c23b0565ce497867aad7",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-i386-unknown-linux",
                            "dlHash": "2b03ab4df4e8a6b093b07e3c5687c1b1c67cab572403c23b0565ce497867aad7",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-i386-unknown-linux",
                            "dlHash": "2b03ab4df4e8a6b093b07e3c5687c1b1c67cab572403c23b0565ce497867aad7",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-i386-unknown-linux",
                            "dlHash": "2b03ab4df4e8a6b093b07e3c5687c1b1c67cab572403c23b0565ce497867aad7",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.1/ghc-9.4.1-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.1-aarch64-unknown-linux",
                            "dlHash": "7e8ed05533b8ed0440bfb4881e3098333a9dadf24cb6857c2446879e43f7362c",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/curated/9.4.1/ghc-9.4.1-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.1-aarch64-apple-darwin",
                            "dlHash": "a3ad3eb3a1f60a544ba7e79d53f081646ffdb257b497ccbdb896870f4009b11c",
                        },
                    },
                },
            },
        },
        "9.4.2": {
            "viTags": [
                "base-4.17.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.2/docs/users_guide/9.4.2-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-src.tar.xz",
                "dlSubdir": "ghc-9.4.2",
                "dlHash": "7227ef3b5e15a0d70b8f1a43aec32867e2a9b2d857cc0ed556aeed172d4db3a5",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.2/ghc-9.4.2-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.2/testsuite",
                "dlHash": "e3e9dedd647cc6936acb507730c1e148e13300ed347ea9752c3bbc7e919b671e",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "71096aea1950ddf64b68ea7ac618ded9531a4c6327d65d258e2c0e3e87dbc81b",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "5bf34ef70a2b824d45e525f09690c76707b7f01698962e425e8fd78b94ea9174",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "6c600173f11c1895469b5028a564ba6ee3a98464742ff054939a015545849145",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "6c600173f11c1895469b5028a564ba6ee3a98464742ff054939a015545849145",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "5bf34ef70a2b824d45e525f09690c76707b7f01698962e425e8fd78b94ea9174",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "71096aea1950ddf64b68ea7ac618ded9531a4c6327d65d258e2c0e3e87dbc81b",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "71096aea1950ddf64b68ea7ac618ded9531a4c6327d65d258e2c0e3e87dbc81b",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "5bf34ef70a2b824d45e525f09690c76707b7f01698962e425e8fd78b94ea9174",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "c88c1a4abe379478b70d2182533f35547c5e266048460b532b47f4f9df68d1da",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "c88c1a4abe379478b70d2182533f35547c5e266048460b532b47f4f9df68d1da",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "017bbf5ba0d526ec82ac97a2ea2a177f162424ea970cd5d6279b843b3d799668",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "c88c1a4abe379478b70d2182533f35547c5e266048460b532b47f4f9df68d1da",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "5bf34ef70a2b824d45e525f09690c76707b7f01698962e425e8fd78b94ea9174",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "c88c1a4abe379478b70d2182533f35547c5e266048460b532b47f4f9df68d1da",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "017bbf5ba0d526ec82ac97a2ea2a177f162424ea970cd5d6279b843b3d799668",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-apple-darwin",
                            "dlHash": "42bfb0412c19e3ae1727fea53208a3d15720f19c11526bb499bbd95af17e4eae",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-mingw32",
                            "dlHash": "3acbe3fc0faa68fa4bf0cc324212956c234c21d7ffd80221cf6caf28726f8227",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                            "dlSubdir": "ghc-9.4.2-x86_64-unknown-linux",
                            "dlHash": "2378dc80ea07308035fa1b695c28e3b32e8a43710bbe5d1edd00acb1af3d350d",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-i386-unknown-linux",
                            "dlHash": "7d94ecbe274470978a984b4079ed8cd18b44720c867d2f9f976645bd25cc0b45",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-i386-unknown-linux",
                            "dlHash": "7d94ecbe274470978a984b4079ed8cd18b44720c867d2f9f976645bd25cc0b45",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-i386-unknown-linux",
                            "dlHash": "7d94ecbe274470978a984b4079ed8cd18b44720c867d2f9f976645bd25cc0b45",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-i386-unknown-linux",
                            "dlHash": "7d94ecbe274470978a984b4079ed8cd18b44720c867d2f9f976645bd25cc0b45",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-i386-unknown-linux",
                            "dlHash": "7d94ecbe274470978a984b4079ed8cd18b44720c867d2f9f976645bd25cc0b45",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.2-aarch64-unknown-linux",
                            "dlHash": "ea075c54143dde37ea50cd085af61abb1fcfce8913deac298adc328bbb349464",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.2-aarch64-apple-darwin",
                            "dlHash": "3f38808ac6b47631487b37535b6792d6594f5e2fbb5204bb9573ed528748e736",
                        },
                    },
                },
            },
        },
        "9.4.3": {
            "viTags": [
                "base-4.17.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.3/docs/users_guide/9.4.3-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-src.tar.xz",
                "dlSubdir": "ghc-9.4.3",
                "dlHash": "eaf63949536ede50ee39179f2299d5094eb9152d87cc6fb2175006bc98e8905a",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.3/ghc-9.4.3-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.3/testsuite",
                "dlHash": "d4a089a97743a795928b23a5f2ac1705b707316175bf72f912af1a7cc7d077f5",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "5419f7df67087646a663d1e16910301287dca027e815f28b532840dc1b8fc4fa",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "940ac2b1770dc63b5f3f38f829bfe69f4a572d6b26cd93094cdd99d5300b5067",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "d08376b15cd90b15b3aa3db902e615b4b0d781ef6598abd89527433bb0f44786",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "d08376b15cd90b15b3aa3db902e615b4b0d781ef6598abd89527433bb0f44786",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "940ac2b1770dc63b5f3f38f829bfe69f4a572d6b26cd93094cdd99d5300b5067",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "5419f7df67087646a663d1e16910301287dca027e815f28b532840dc1b8fc4fa",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "5419f7df67087646a663d1e16910301287dca027e815f28b532840dc1b8fc4fa",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "940ac2b1770dc63b5f3f38f829bfe69f4a572d6b26cd93094cdd99d5300b5067",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "4cdc8f666e48aceeadf40affcff1a74002d879d58eb743a45e67cd163968eae0",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "4cdc8f666e48aceeadf40affcff1a74002d879d58eb743a45e67cd163968eae0",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "50037bc8672f0429e2de1255b21f04529807182cf74887a60e4d416d3b6ce8f2",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "4cdc8f666e48aceeadf40affcff1a74002d879d58eb743a45e67cd163968eae0",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "940ac2b1770dc63b5f3f38f829bfe69f4a572d6b26cd93094cdd99d5300b5067",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "4cdc8f666e48aceeadf40affcff1a74002d879d58eb743a45e67cd163968eae0",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "50037bc8672f0429e2de1255b21f04529807182cf74887a60e4d416d3b6ce8f2",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-apple-darwin",
                            "dlHash": "501d264f2f73faa63b4e6d9569dc7d12ad97af11827c7b55d346cc6795ff5e04",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-mingw32",
                            "dlHash": "a1169919303518f598d53670c1155b2bfec9e1147e8c42bfb8b64b91207bee55",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                            "dlSubdir": "ghc-9.4.3-x86_64-unknown-linux",
                            "dlHash": "4a2869fce0606884458f92a67655dd917c00e93a7230bbb4a8bbd28b994d875e",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-i386-unknown-linux",
                            "dlHash": "f7140655a50672f33c9b09880f5159f5eaa77e7e9330aa80996ab63712480e83",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-i386-unknown-linux",
                            "dlHash": "f7140655a50672f33c9b09880f5159f5eaa77e7e9330aa80996ab63712480e83",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-i386-unknown-linux",
                            "dlHash": "f7140655a50672f33c9b09880f5159f5eaa77e7e9330aa80996ab63712480e83",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-i386-unknown-linux",
                            "dlHash": "f7140655a50672f33c9b09880f5159f5eaa77e7e9330aa80996ab63712480e83",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-i386-unknown-linux",
                            "dlHash": "f7140655a50672f33c9b09880f5159f5eaa77e7e9330aa80996ab63712480e83",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.3-aarch64-unknown-linux",
                            "dlHash": "9694131b02f938e72e1740b772ff1c1c81a36ef44233dc230bbd978e7dd08e71",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.3/ghc-9.4.3-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.3-aarch64-apple-darwin",
                            "dlHash": "531c0a4708655bc8707ba88b8a72d34b5958fddc519a12359613f6db62f0eb82",
                        },
                    },
                },
            },
        },
        "9.4.4": {
            "viTags": [
                "base-4.17.0.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.4/docs/users_guide/9.4.4-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-src.tar.xz",
                "dlSubdir": "ghc-9.4.4",
                "dlHash": "e8cef25a6ded1531cda7a90488d0cfb6d780657d16636daa59430be030cd67e2",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.4/ghc-9.4.4-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.4/testsuite",
                "dlHash": "4349d6a0680cf62b54a76aa859a0c7186635a0971efeecccf676bcdeb9a2e212",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "5b8751614fa60ecab2ce244bfe8c75603e9e475f5087192cd4598148eb127045",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "a3ecd2426bb519d6fdad05904c386f1c74b433f07722b0d1ef606c23159ade2d",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "3794e9ebf463beb7d39e781fa3ef5b344c6144bc405192f1086f855ba8b227b3",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "3794e9ebf463beb7d39e781fa3ef5b344c6144bc405192f1086f855ba8b227b3",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "a3ecd2426bb519d6fdad05904c386f1c74b433f07722b0d1ef606c23159ade2d",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "5b8751614fa60ecab2ce244bfe8c75603e9e475f5087192cd4598148eb127045",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "5b8751614fa60ecab2ce244bfe8c75603e9e475f5087192cd4598148eb127045",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "a3ecd2426bb519d6fdad05904c386f1c74b433f07722b0d1ef606c23159ade2d",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "03446cc252e413ea7650ebc404c04a8e80ad617e1f3557b14168d45225357f25",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "03446cc252e413ea7650ebc404c04a8e80ad617e1f3557b14168d45225357f25",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "8d6dee632966123ec901660cd155dfdc3aa3f13116574215d958a4705b8327e1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "03446cc252e413ea7650ebc404c04a8e80ad617e1f3557b14168d45225357f25",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "a3ecd2426bb519d6fdad05904c386f1c74b433f07722b0d1ef606c23159ade2d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "03446cc252e413ea7650ebc404c04a8e80ad617e1f3557b14168d45225357f25",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "8d6dee632966123ec901660cd155dfdc3aa3f13116574215d958a4705b8327e1",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.4.4/ghc-9.4.4-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-portbld-freebsd",
                            "dlHash": "42eba2c1eb0b7a420a79ee3f3bb1f649926ea78ca8fee176491c087aa48ea7ef",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-apple-darwin",
                            "dlHash": "3a35e355ef993830c273f86ab6286aab3e825f6e53288d1980e473911e4ede94",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-mingw32",
                            "dlHash": "160f9ccee997dab0cfc98b2b761e1972a2bfc47389635ba57e8a0084f7d41aa7",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                            "dlSubdir": "ghc-9.4.4-x86_64-unknown-linux",
                            "dlHash": "526521f713d5d3f6e9ad1ca4ad88011e98e5a199dcd79f74daaeddc4172f4edc",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-i386-unknown-linux",
                            "dlHash": "22b8b528afba4e1d6536a68f3c31037e4b106c699b2bbad5769a6a8473c0dab4",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-i386-unknown-linux",
                            "dlHash": "22b8b528afba4e1d6536a68f3c31037e4b106c699b2bbad5769a6a8473c0dab4",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-i386-unknown-linux",
                            "dlHash": "22b8b528afba4e1d6536a68f3c31037e4b106c699b2bbad5769a6a8473c0dab4",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-i386-unknown-linux",
                            "dlHash": "22b8b528afba4e1d6536a68f3c31037e4b106c699b2bbad5769a6a8473c0dab4",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-i386-unknown-linux",
                            "dlHash": "22b8b528afba4e1d6536a68f3c31037e4b106c699b2bbad5769a6a8473c0dab4",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.4-aarch64-unknown-linux",
                            "dlHash": "2c0f22a7430490be3071f88240761bd7aadb7d40f22c6b9f1d2485ffcdf4e2e0",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.4-aarch64-apple-darwin",
                            "dlHash": "b50507b229e0c418b32e4b6cc060288ba9497fdd912962e3b0707d0a2b003658",
                        },
                    },
                },
            },
        },
        "9.4.5": {
            "viTags": [
                "base-4.17.1.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.5/docs/users_guide/9.4.5-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-src.tar.xz",
                "dlSubdir": "ghc-9.4.5",
                "dlHash": "6256cf9caf6d6dc7b611dcfbb247df2d528e85aa39d22a698e870e5a590e8601",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.5/ghc-9.4.5-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.5/testsuite",
                "dlHash": "97d6dd8c889a1114e5038dec4b66e875cce157a2855a9a60bfdbcde804cf4573",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "7508314c884c69738e93eb69b919d965e83c444830ae53c5991818f8414634be",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "a44c39c4cc9a147de6dd31762995a9e47467cc91757800d80667b8cd60a9b226",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "561ccb6b155672f5077fd79daf13a862710049202c7448ce82ee2ee1d9063bc7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "561ccb6b155672f5077fd79daf13a862710049202c7448ce82ee2ee1d9063bc7",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "a44c39c4cc9a147de6dd31762995a9e47467cc91757800d80667b8cd60a9b226",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "7508314c884c69738e93eb69b919d965e83c444830ae53c5991818f8414634be",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "7508314c884c69738e93eb69b919d965e83c444830ae53c5991818f8414634be",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "a44c39c4cc9a147de6dd31762995a9e47467cc91757800d80667b8cd60a9b226",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "d9cacea4a948bd03c03ee432c33a71304d1a5db6657ee613f2a83088581321be",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "d9cacea4a948bd03c03ee432c33a71304d1a5db6657ee613f2a83088581321be",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 33 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "ba10e15d8f20ff5451f2dbfee0601210dbbacc63de1bdcef8d2d91763fde84ea",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "3cf52bc88ec212d0aed3bbcc1f3e54c61cc639975f90302b44b3f4d1eee3f153",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "d9cacea4a948bd03c03ee432c33a71304d1a5db6657ee613f2a83088581321be",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "ba10e15d8f20ff5451f2dbfee0601210dbbacc63de1bdcef8d2d91763fde84ea",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "d9cacea4a948bd03c03ee432c33a71304d1a5db6657ee613f2a83088581321be",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "ba10e15d8f20ff5451f2dbfee0601210dbbacc63de1bdcef8d2d91763fde84ea",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-apple-darwin",
                            "dlHash": "f8cf9bb725120c25fac909834c79786ac646c97dc3cd69a1ef0b734b489d6709",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-mingw32",
                            "dlHash": "1b65ccb99b5e0bc6ad535b58323b023c61a675e0c3a0d53b82f819e55a7dd8d7",
                        },
                    },
                    "FreeBSD": {
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.4.5/ghc-9.4.5-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-portbld-freebsd",
                            "dlHash": "846bb2cb2ec76221b76864556deb8cd6440a9eab7a7c3bb3e973186b46d6243b",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                            "dlSubdir": "ghc-9.4.5-x86_64-unknown-linux",
                            "dlHash": "fd5fd84e75909baf952f26287ce2396d664dbfca251f0696ae7f31a868b59520",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-i386-unknown-linux",
                            "dlHash": "74a940f8afb4332f5eb0cde6aa6def8c8aae8c8632b05884a226434c86a644ec",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-i386-unknown-linux",
                            "dlHash": "74a940f8afb4332f5eb0cde6aa6def8c8aae8c8632b05884a226434c86a644ec",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-i386-unknown-linux",
                            "dlHash": "74a940f8afb4332f5eb0cde6aa6def8c8aae8c8632b05884a226434c86a644ec",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-i386-unknown-linux",
                            "dlHash": "74a940f8afb4332f5eb0cde6aa6def8c8aae8c8632b05884a226434c86a644ec",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-i386-unknown-linux",
                            "dlHash": "74a940f8afb4332f5eb0cde6aa6def8c8aae8c8632b05884a226434c86a644ec",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.5-aarch64-unknown-linux",
                            "dlHash": "ecf16ec503e739e727174b29e5acbe4cf0c54737dd4d5eda046e09323f9ee248",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.5/ghc-9.4.5-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.5-aarch64-apple-darwin",
                            "dlHash": "edd28a261f4d608be59000fb4c4a4d37b2cc825e6d46aded6612661de7d066a0",
                        },
                    },
                },
            },
        },
        "9.4.6": {
            "viTags": [
                "base-4.17.2.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.6/docs/users_guide/9.4.6-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-src.tar.xz",
                "dlSubdir": "ghc-9.4.6",
                "dlHash": "1b705cf52692f9d4d6707cdf8e761590f5f56ec8ea6a65e36610db392d3d24b9",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.6/ghc-9.4.6-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.6/testsuite",
                "dlHash": "82019b2013cb8ff7380ee63a6ab1daa2c92793da3ddfd4a8cddb7b8dc4602ecf",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "345267ac5c142c7914debffc5c1f9cafd2bec100eb1fb70aa8b114c28d33dc0f",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "6061c20ff4e154e81944dfc9f37afff5aaa05ce51ad25db3425ff85bb85a92a3",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "43da1a641307fcd97b324648adcd39b673b94ab61507b5639038b36abf938569",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "43da1a641307fcd97b324648adcd39b673b94ab61507b5639038b36abf938569",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "6061c20ff4e154e81944dfc9f37afff5aaa05ce51ad25db3425ff85bb85a92a3",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "345267ac5c142c7914debffc5c1f9cafd2bec100eb1fb70aa8b114c28d33dc0f",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "345267ac5c142c7914debffc5c1f9cafd2bec100eb1fb70aa8b114c28d33dc0f",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "6061c20ff4e154e81944dfc9f37afff5aaa05ce51ad25db3425ff85bb85a92a3",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "13bac0c0cbcfe75982d8b08c51dd5e50116d7760474a07b97bd82a0bd5c2ec18",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "13bac0c0cbcfe75982d8b08c51dd5e50116d7760474a07b97bd82a0bd5c2ec18",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 33 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "a83f4bcfa770eb61ee1a49130acedfd5f0ebb4e93644fb88904490dfb4a4c466",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "20d7689e5929d0f9908a60d0f00195d9f0164e31847e00e08cd511d6d22bff3d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "13bac0c0cbcfe75982d8b08c51dd5e50116d7760474a07b97bd82a0bd5c2ec18",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "a83f4bcfa770eb61ee1a49130acedfd5f0ebb4e93644fb88904490dfb4a4c466",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "13bac0c0cbcfe75982d8b08c51dd5e50116d7760474a07b97bd82a0bd5c2ec18",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "a83f4bcfa770eb61ee1a49130acedfd5f0ebb4e93644fb88904490dfb4a4c466",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-apple-darwin",
                            "dlHash": "8febddd1e9a099e61bc74186958f029ffcbad37db500bc1c97cc5fda5af05557",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-mingw32",
                            "dlHash": "643ede1e715b91c4caac1739eb719176d58dd6c83c58c3c78f4018b2165c6bc8",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                            "dlSubdir": "ghc-9.4.6-x86_64-unknown-linux",
                            "dlHash": "f2919708f56f16f696e8050ea41e100a9b4f48be581b50791beadb1a253c4396",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-i386-unknown-linux",
                            "dlHash": "b1089ef8fb69bf4411bdb1384a9c1d0902f10c176e60ba31d93c24b00cf0b81d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-i386-unknown-linux",
                            "dlHash": "b1089ef8fb69bf4411bdb1384a9c1d0902f10c176e60ba31d93c24b00cf0b81d",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-i386-unknown-linux",
                            "dlHash": "b1089ef8fb69bf4411bdb1384a9c1d0902f10c176e60ba31d93c24b00cf0b81d",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-i386-unknown-linux",
                            "dlHash": "b1089ef8fb69bf4411bdb1384a9c1d0902f10c176e60ba31d93c24b00cf0b81d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-i386-unknown-linux",
                            "dlHash": "b1089ef8fb69bf4411bdb1384a9c1d0902f10c176e60ba31d93c24b00cf0b81d",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.6-aarch64-unknown-linux",
                            "dlHash": "b27e4e4d760216457c20fdce3ec419e1bac905608e6577c2c2fa15f4a3779370",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.6/ghc-9.4.6-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.6-aarch64-apple-darwin",
                            "dlHash": "0be43adf6449d010a8d0f4c66353eff7faae0570554fa25e411c579102923dfb",
                        },
                    },
                },
            },
        },
        "9.4.7": {
            "viTags": [
                "base-4.17.2.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.7/docs/users_guide/9.4.7-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-src.tar.xz",
                "dlSubdir": "ghc-9.4.7",
                "dlHash": "06775a52b4d13ac09edc6dabc299fd11e59d8886bbcae450af367baee2684c8f",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.7/ghc-9.4.7-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.7/testsuite",
                "dlHash": "a7ce907f7e3d38bee33af5cc23c74b53fe30d600fe5fc63b409c4c5675d2a69d",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "52a20a1f87b84ce6b34d830a849cd29404228cfbfeb114f81ea28bcb60edeca8",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "6b5b939d20b47475358993210738578071005669500810f28746bbd856ed878b",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "364d1d0af4289b6492d464e740cc48eda980d2e7904b5d6a0133553adca4c1ab",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "364d1d0af4289b6492d464e740cc48eda980d2e7904b5d6a0133553adca4c1ab",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "6b5b939d20b47475358993210738578071005669500810f28746bbd856ed878b",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "52a20a1f87b84ce6b34d830a849cd29404228cfbfeb114f81ea28bcb60edeca8",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "52a20a1f87b84ce6b34d830a849cd29404228cfbfeb114f81ea28bcb60edeca8",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "6b5b939d20b47475358993210738578071005669500810f28746bbd856ed878b",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "20e4314966162d5fe1b29551f09d12e077ef849f41f58a205b9fe66a64da2b1d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "20e4314966162d5fe1b29551f09d12e077ef849f41f58a205b9fe66a64da2b1d",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 33 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "216b76b7c6383e6ad9ba82533f323f8550e52893a8b9fa33c7b9dc4201ac766a",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "bc369dc7550b4e45a0c1ebc73b5ea2235e8d0913761f410655a83c21c9ba3e20",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "20e4314966162d5fe1b29551f09d12e077ef849f41f58a205b9fe66a64da2b1d",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "216b76b7c6383e6ad9ba82533f323f8550e52893a8b9fa33c7b9dc4201ac766a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "20e4314966162d5fe1b29551f09d12e077ef849f41f58a205b9fe66a64da2b1d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "216b76b7c6383e6ad9ba82533f323f8550e52893a8b9fa33c7b9dc4201ac766a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-apple-darwin",
                            "dlHash": "2c874dc685cb72b0c4d6f226b795051705a923c25080eeba05d546350474cb1e",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-mingw32",
                            "dlHash": "415e6adebd764d278ecfe4ebf656ff96902953b8b669fba7dae2525af6665172",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-x86_64-alpine3_12-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-x86_64-unknown-linux",
                            "dlHash": "d26b4e8d14f4e547d63661122c78cf00686923a62916cb4151234e8e955ef7d4",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-i386-unknown-linux",
                            "dlHash": "be0ca9fc24bd9cbc3684eade6ba3b9ddbc8def8e1e216a3cbc2f24ce0a53fc48",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-i386-unknown-linux",
                            "dlHash": "be0ca9fc24bd9cbc3684eade6ba3b9ddbc8def8e1e216a3cbc2f24ce0a53fc48",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-i386-unknown-linux",
                            "dlHash": "be0ca9fc24bd9cbc3684eade6ba3b9ddbc8def8e1e216a3cbc2f24ce0a53fc48",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-i386-unknown-linux",
                            "dlHash": "be0ca9fc24bd9cbc3684eade6ba3b9ddbc8def8e1e216a3cbc2f24ce0a53fc48",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-i386-unknown-linux",
                            "dlHash": "be0ca9fc24bd9cbc3684eade6ba3b9ddbc8def8e1e216a3cbc2f24ce0a53fc48",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.7-aarch64-unknown-linux",
                            "dlHash": "05896fc4bc52c117d281eac9c621c6c3a0b14f9f9eed5e42cce5e1c4485c7623",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.7/ghc-9.4.7-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.7-aarch64-apple-darwin",
                            "dlHash": "5d85f9836d72d45634039218ed52e9faa0ed00c0db056f3d1162b4c2b3838e38",
                        },
                    },
                },
            },
        },
        "9.4.8": {
            "viTags": [
                "base-4.17.2.1",
                "Recommended",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.4.8/docs/users_guide/9.4.8-notes.html",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-src.tar.xz",
                "dlSubdir": "ghc-9.4.8",
                "dlHash": "0bf407eb67fe3e3c24b0f4c8dea8cb63e07f63ca0f76cf2058565143507ab85e",
            },
            "viTestDL": {
                "dlUri": "https://downloads.haskell.org/ghc/9.4.8/ghc-9.4.8-testsuite.tar.xz",
                "dlSubdir": "ghc-9.4.8/testsuite",
                "dlHash": "ac45dd44b097707a2717058ab2cfff22777ec0f31bfa3f54bf60e18b2dd63c95",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "b9d2b4326c907c5ce5fe0502ea089583c1af4529a17f2e18d103f10f430bb036",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "fc77eaae5b89f29177bf159fd95ce438066ec64a46bf69df61b267102afdb10e",
                        },
                        ">= 11": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "2743629d040f3213499146cb5154621d6f25e85271019afc9b9009e04d66bf6c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb11-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "2743629d040f3213499146cb5154621d6f25e85271019afc9b9009e04d66bf6c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "fc77eaae5b89f29177bf159fd95ce438066ec64a46bf69df61b267102afdb10e",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "b9d2b4326c907c5ce5fe0502ea089583c1af4529a17f2e18d103f10f430bb036",
                        },
                        ">= 20": {
                            "dlHash": "da1a1ddce5b39f6e30d8a2392753835a41ffc5ec4b914e0845270fe3a2ba4761",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "b9d2b4326c907c5ce5fe0502ea089583c1af4529a17f2e18d103f10f430bb036",
                        },
                        ">= 20": {
                            "dlHash": "da1a1ddce5b39f6e30d8a2392753835a41ffc5ec4b914e0845270fe3a2ba4761",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "e9240fdbf877ac218f95b46c40637e0b1a05cce659dc613451f8942a8e9bdd4c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "e9240fdbf877ac218f95b46c40637e0b1a05cce659dc613451f8942a8e9bdd4c",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 33 )": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "788241ed035af45eb387ea379743edc6fe4683cd0f47f48499c1a0b728fc6778",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-fedora33-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "cc90dc1969af7e1d45b2c086602cea6cc92c2a770913a8c0e28570ca855ece5a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "e9240fdbf877ac218f95b46c40637e0b1a05cce659dc613451f8942a8e9bdd4c",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "788241ed035af45eb387ea379743edc6fe4683cd0f47f48499c1a0b728fc6778",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-centos7-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "e9240fdbf877ac218f95b46c40637e0b1a05cce659dc613451f8942a8e9bdd4c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-fedora27-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "788241ed035af45eb387ea379743edc6fe4683cd0f47f48499c1a0b728fc6778",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-apple-darwin",
                            "dlHash": "fd9e21c2a9a10c60e39049e9cf1519b5b6a98a5b37e7623ba17bbd6e8dfc2036",
                        },
                    },
                    "FreeBSD": {
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.4.8/ghc-9.4.8-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-portbld-freebsd",
                            "dlHash": "36bdf52b441c8ef5a2768295407aea5f302a00c122b70b6bb2b352a8df221ad8",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-unknown-mingw32.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-mingw32",
                            "dlHash": "c4a767218551210521c78ddb51bfb309b0e336eef21eba1cc076f3bc0cc99a00",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-x86_64-alpine3_12-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-x86_64-unknown-linux",
                            "dlHash": "55faf0ec6630d635f97a2bf8f8f79ef587b027962d237f0be3a667b1bbb512b8",
                        },
                    },
                },
                "A_32": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-i386-unknown-linux",
                            "dlHash": "1e3ed137346f6736ddd9a25045ccf686236216f198e7eb30671e2cf8546df658",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-i386-unknown-linux",
                            "dlHash": "1e3ed137346f6736ddd9a25045ccf686236216f198e7eb30671e2cf8546df658",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-i386-unknown-linux",
                            "dlHash": "1e3ed137346f6736ddd9a25045ccf686236216f198e7eb30671e2cf8546df658",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-i386-unknown-linux",
                            "dlHash": "1e3ed137346f6736ddd9a25045ccf686236216f198e7eb30671e2cf8546df658",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-i386-deb9-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-i386-unknown-linux",
                            "dlHash": "1e3ed137346f6736ddd9a25045ccf686236216f198e7eb30671e2cf8546df658",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.4.8/ghc-9.4.8-i386-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-i386-unknown-linux",
                            "dlHash": "4738a79a7d5148fc0fdfcb7c6f9eb38f9da4f0ebe2ebeb47dcc6f0efbe88b334",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-aarch64-deb10-linux.tar.xz",
                            "dlSubdir": "ghc-9.4.8-aarch64-unknown-linux",
                            "dlHash": "278e287e1ee624712b9c6d7803d1cf915ca1cce56e013b0a16215eb8dfeb1531",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "ghc-9.4.8-aarch64-apple-darwin",
                            "dlHash": "32385043d824a56983b484da5c0b3504d14b6504764731b0d48f3522ed8497ca",
                        },
                    },
                },
            },
        },
        "9.6.1": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "<10": {
                            "dlHash": "5c0a14ec107a99aa084e18cb595cc2d445d6c2fdc5365bbf3b82248205638a85",
                            "dlSubdir": "ghc-9.6.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-i386-deb9-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "5c0a14ec107a99aa084e18cb595cc2d445d6c2fdc5365bbf3b82248205638a85",
                            "dlSubdir": "ghc-9.6.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "5c0a14ec107a99aa084e18cb595cc2d445d6c2fdc5365bbf3b82248205638a85",
                            "dlSubdir": "ghc-9.6.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "5c0a14ec107a99aa084e18cb595cc2d445d6c2fdc5365bbf3b82248205638a85",
                            "dlSubdir": "ghc-9.6.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "5c0a14ec107a99aa084e18cb595cc2d445d6c2fdc5365bbf3b82248205638a85",
                            "dlSubdir": "ghc-9.6.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-i386-deb9-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "3dcca5e83795b5b7c0af636216dc2ef9c40c70fb368bc7feb2a74921c81445ff",
                            "dlSubdir": "ghc-9.6.1-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "d2eac4b74b57ad5840cd7f4c7ee2fe11ede74679b71b66a4e784c02eaa059d7f",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "c7fb1b5acd69cf0b940bcd4548b423cd5d7ca219f244cee6807fe307e0f08c4e",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c7fb1b5acd69cf0b940bcd4548b423cd5d7ca219f244cee6807fe307e0f08c4e",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "48d533c88ba2d852c50eaf98859a7779844512d05577f1ced17cc68cc63f4d03",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "3c727e93a82ff039fbedd6645518859849130a0fc93b7181cd69a41800aa639c",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "73222632a1154fd2e54c6920609cb68ddee2915675f04d74b08b24f9cc492ee6",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "73222632a1154fd2e54c6920609cb68ddee2915675f04d74b08b24f9cc492ee6",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "5405b5fd66ab30e19c69bfb0eb27ac62069ee2d5af9d413ece835b8ad1e3c15d",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c7fb1b5acd69cf0b940bcd4548b423cd5d7ca219f244cee6807fe307e0f08c4e",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "5c9dd525e2cc8a1aed75dbf0676ab51fbcf555960fca9734cbd0a39d0850f64d",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "95cfd9d1144eb14a01b43474c2ebfe8a50373a8d8ea53ebac461d4fa4878e4ed",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlHash": "97172efe434bfe27c112f16b3ab3708c1fb3defb5c1d1319c738c7afea95901d",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-rocky8-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c7fb1b5acd69cf0b940bcd4548b423cd5d7ca219f244cee6807fe307e0f08c4e",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "3c727e93a82ff039fbedd6645518859849130a0fc93b7181cd69a41800aa639c",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "5c9dd525e2cc8a1aed75dbf0676ab51fbcf555960fca9734cbd0a39d0850f64d",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "95cfd9d1144eb14a01b43474c2ebfe8a50373a8d8ea53ebac461d4fa4878e4ed",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "97172efe434bfe27c112f16b3ab3708c1fb3defb5c1d1319c738c7afea95901d",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "6121a889839d8b409f082169365bbfb6ed9e6a1f6ff0531d577ef7c2a9a417fb",
                            "dlSubdir": "ghc-9.6.1-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlHash": "2ac55172f49092de7917adb7950edfacc97f43652edc16851d2b25d67813c1af",
                            "dlSubdir": "ghc-9.6.1-x86_64-portbld-freebsd",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.1/ghc-9.6.1-x86_64-portbld-freebsd-gmp-native.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "1729e8cec960879c620917d935a673e54197fa2ee87c62e45c44fad2e522960a",
                            "dlSubdir": "ghc-9.6.1-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "0fd57fdc9e7b9c0850350492deea1c00016d751c89c11478cfe6b6038da0c6db",
                            "dlSubdir": "ghc-9.6.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.6.1/docs/users_guide/9.6.1-notes.html",
            "viSourceDL": {
                "dlHash": "fe5ac909cb8bb087e235de97fa63aff47a8ae650efaa37a2140f4780e21f34cb",
                "dlSubdir": "ghc-9.6.1",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-src.tar.xz",
            },
            "viTags": [
                "base-4.18.0.0",
                "old",
            ],
            "viTestDL": {
                "dlHash": "8bfa74d102da570cb87fbbc3465c7f778a4e6dc76606fef80207de7e8b64114f",
                "dlSubdir": "ghc-9.6.1/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.1/ghc-9.6.1-testsuite.tar.xz",
            },
        },
        "9.6.2": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "<10": {
                            "dlHash": "1fe47d995faec952812fe6a6b3b00bdb17a22e00c6c9f7b332ee87a4b453c1e2",
                            "dlSubdir": "ghc-9.6.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-i386-deb9-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "1fe47d995faec952812fe6a6b3b00bdb17a22e00c6c9f7b332ee87a4b453c1e2",
                            "dlSubdir": "ghc-9.6.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "1fe47d995faec952812fe6a6b3b00bdb17a22e00c6c9f7b332ee87a4b453c1e2",
                            "dlSubdir": "ghc-9.6.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "1fe47d995faec952812fe6a6b3b00bdb17a22e00c6c9f7b332ee87a4b453c1e2",
                            "dlSubdir": "ghc-9.6.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "1fe47d995faec952812fe6a6b3b00bdb17a22e00c6c9f7b332ee87a4b453c1e2",
                            "dlSubdir": "ghc-9.6.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-i386-deb9-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "2eb62788c1b4a61b2fc96e9d8500bede89a9bf37319f001ee867b312aab3a134",
                            "dlSubdir": "ghc-9.6.2-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "ec116c1da0f6851600789815762a33adf8ec08c4b6257d0c0fb767e1c99fdcb0",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-alpine3_12-linux-static-int_native.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "26d356288cd81ec188e73496b1859e210b7ac57f885e4319de5988db8145d543",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "26d356288cd81ec188e73496b1859e210b7ac57f885e4319de5988db8145d543",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "63d4bbcee19a343bcdb7bc7c6ca85b1f666a26c7a64fba9014d2160ec3d4ad20",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "c18946d886ee00710e44da9aeb07f2b025a686c76309fcf37c421f0f800d72ac",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "d44008faf6787e52b63c2f09b2e1839998f1dff244cc9d34dd70dd70554d8e5d",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d44008faf6787e52b63c2f09b2e1839998f1dff244cc9d34dd70dd70554d8e5d",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "87b6dff4f0fc94b2d939a4c133b68a835844c639e866e2c6430066d9eb25cdd8",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "26d356288cd81ec188e73496b1859e210b7ac57f885e4319de5988db8145d543",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "e77c365f93cbf89a4079d451ba743dabc656b2c67382341f5bb0a0c00401a57e",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "f3f71385537838c564a7a40498cc2745fd01a236e4f473b844968821e2c3a3ff",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "26d356288cd81ec188e73496b1859e210b7ac57f885e4319de5988db8145d543",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "c18946d886ee00710e44da9aeb07f2b025a686c76309fcf37c421f0f800d72ac",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "e77c365f93cbf89a4079d451ba743dabc656b2c67382341f5bb0a0c00401a57e",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "f3f71385537838c564a7a40498cc2745fd01a236e4f473b844968821e2c3a3ff",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "cd0a1eed442bf05005bb8c82ab77592ce873c57f767f25f7776474b4c257f1fd",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "89a37bdaff3e8ec237249c6c178ed94ef446478d51d0de53be4ab7a0b19f1512",
                            "dlSubdir": "ghc-9.6.2-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "7351933097f7ff2896fede102f9df612cc03e49565800e207ad91fb318f84da0",
                            "dlSubdir": "ghc-9.6.2-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "5ad6153718d23a025f0f547f099bcecdf325edb5f5e16a9ec8bdeb17bad3c128",
                            "dlSubdir": "ghc-9.6.2-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.6.2/docs/users_guide/9.6.2-notes.html",
            "viSourceDL": {
                "dlHash": "1b510c5f8753c3ba24851702c6c9da7d81dc5e47fe3ecb7af39c7c2613abf170",
                "dlSubdir": "ghc-9.6.2",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-src.tar.xz",
            },
            "viTags": [
                "base-4.18.0.0",
                "old",
            ],
            "viTestDL": {
                "dlHash": "e4ffbc2d6db720fba30f8e7e12214522c470d1cfc0ee69f7997782b0ae20abbf",
                "dlSubdir": "ghc-9.6.2/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.2/ghc-9.6.2-testsuite.tar.xz",
            },
        },
        "9.6.3": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "<10": {
                            "dlHash": "58be26f8b8f6b5bd8baf5c32abb03e2c4621646b2142fab10e5c7de5af5c50f8",
                            "dlSubdir": "ghc-9.6.3-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-i386-deb9-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "58be26f8b8f6b5bd8baf5c32abb03e2c4621646b2142fab10e5c7de5af5c50f8",
                            "dlSubdir": "ghc-9.6.3-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "58be26f8b8f6b5bd8baf5c32abb03e2c4621646b2142fab10e5c7de5af5c50f8",
                            "dlSubdir": "ghc-9.6.3-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "58be26f8b8f6b5bd8baf5c32abb03e2c4621646b2142fab10e5c7de5af5c50f8",
                            "dlSubdir": "ghc-9.6.3-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "58be26f8b8f6b5bd8baf5c32abb03e2c4621646b2142fab10e5c7de5af5c50f8",
                            "dlSubdir": "ghc-9.6.3-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "f06fda5e0eebf9325b6b471b2b77ab6072c42927c151a97382973f0f7d6ba9e2",
                            "dlSubdir": "ghc-9.6.3-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.6.3/ghc-9.6.3-i386-alpine-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "dde46118ab8388fb1066312c097123e93b1dcf6ae366e3370f88ea456382c9db",
                            "dlSubdir": "ghc-9.6.3-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.6.3/ghc-9.6.3-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.6.3-x86_64-portbld-freebsd",
                            "dlHash": "e011a1663903412f1e6b05a1f84520cfaa4a3583cdf88424db2950fc7e9d152e",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "b4d1540dffc1f4864a3e6a0f1cb20e258c6ea87fbc9837d1bc8a920505727299",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.6.3/ghc-9.6.3-x86_64-alpine-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "30ac2ada05a14aa785e3dd07edc9bba6e94043015bb1cafd75206315766132a4",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "30ac2ada05a14aa785e3dd07edc9bba6e94043015bb1cafd75206315766132a4",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "9ba0458c84efdbba69509c3c57497e22ad03743f816eb9c8b024abc13f7aacaa",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "ba11f4e91448a9d7243f07dde2a1bdf68288427ad454aa17854e56f59c5a5337",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "c4c0124857265926f1cf22a09d950d7ba989ff94053a4ddf3dcdab5359f4cab7",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c4c0124857265926f1cf22a09d950d7ba989ff94053a4ddf3dcdab5359f4cab7",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "21800b5faaf872d218766d9bf97b8d7f97df3cfae4b570dfd79d3327d9e3cdab",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "30ac2ada05a14aa785e3dd07edc9bba6e94043015bb1cafd75206315766132a4",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "a499c05f554b6e6b7f04c81b376f1e569614e51864672c9226a696617bc6c640",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "d2018768b53ab2c9ab4d543d1e8d7c2b1fb78707b70c74c96ff1733e82f22b80",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "30ac2ada05a14aa785e3dd07edc9bba6e94043015bb1cafd75206315766132a4",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "ba11f4e91448a9d7243f07dde2a1bdf68288427ad454aa17854e56f59c5a5337",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "a499c05f554b6e6b7f04c81b376f1e569614e51864672c9226a696617bc6c640",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d2018768b53ab2c9ab4d543d1e8d7c2b1fb78707b70c74c96ff1733e82f22b80",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "56ed24e986749572f21c5249f43390fc7ae5078e3f296a33d693b4ad4b907fe1",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "0cc0e2d290a87c540268e62cc71f8eced2a24f621beeb524cce61bebf644f064",
                            "dlSubdir": "ghc-9.6.3-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "e1cdf458926b2eaf52d2a8287d99a965040ff9051171f5c3b7467049cf0eb213",
                            "dlSubdir": "ghc-9.6.3-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "03c389859319f09452081310fc13af7525063ea8930830ef76be2a14b312271e",
                            "dlSubdir": "ghc-9.6.3-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.6.3/docs/users_guide/9.6.3-notes.html",
            "viSourceDL": {
                "dlHash": "dfcde67b4aa550a0b8a1a9bb8105835dc999fad6397cce33d72fd55d21eb77f5",
                "dlSubdir": "ghc-9.6.3",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.3/ghc-9.6.3-src.tar.xz",
            },
            "viTags": [
                "base-4.18.1.0",
                "old",
            ],
            "viTestDL": {
                "dlHash": "b0f92579288adf2320206627248d80d2abfe0e1b9ad2a22cf8f889bbe6806448",
                "dlSubdir": "ghc-9.6.3/testsuite",
                "dlUri": "https://downloads.haskell.org/ghc/9.6.3/ghc-9.6.3-testsuite.tar.xz",
            },
        },
        "9.6.4": {
            "viTags": [
                "base-4.18.2.0",
                "old",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.6.4/docs/users_guide/9.6.4-notes.html",
            "viSourceDL": {
                "dlHash": "10bf25b8b07174fdd9868b5c0c56c17c0ef1edcb6247b4b864be933651bfd4c0",
                "dlSubdir": "ghc-9.6.4",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-src.tar.xz",
            },
            "viTestDL": {
                "dlHash": "6e13282fbebffdbfa0a49889437444c9a90cfe5760c47969cd4245854c338d73",
                "dlSubdir": "ghc-9.6.4/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-testsuite.tar.xz",
            },
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "<10": {
                            "dlHash": "2069bbeeca4b4beef5343393a383fcd5b2ceae33be06006c512169d21f8eb9f8",
                            "dlSubdir": "ghc-9.6.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-i386-deb9-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "2069bbeeca4b4beef5343393a383fcd5b2ceae33be06006c512169d21f8eb9f8",
                            "dlSubdir": "ghc-9.6.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "2069bbeeca4b4beef5343393a383fcd5b2ceae33be06006c512169d21f8eb9f8",
                            "dlSubdir": "ghc-9.6.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-i386-deb9-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "b897cbd156690f4e6cc4400f6b9465d610ea228d8527f8bd501210d1b93a4eab",
                            "dlSubdir": "ghc-9.6.4-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "914605fde1f0659468c5d6df934da54bd333535b33255dd1b8a6ff7e0a7463b5",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "96231c5abcf397996f844e7db30954199eb5b4a407e3b31d6a4ed3ffd75bad2e",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "96231c5abcf397996f844e7db30954199eb5b4a407e3b31d6a4ed3ffd75bad2e",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "59885c43902110262cda168513dc6a9cc750e3e728dffb0cdb168e44929cb014",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "972c1c7cbc276741ceb9e4efc58ad4727e163317d5dcbf350404b84470300271",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "9c96072c64ea022f0006cc444762f666b7fbadfdc9ac556089a4ea2448187a73",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "9c96072c64ea022f0006cc444762f666b7fbadfdc9ac556089a4ea2448187a73",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "6fd5574c66ecd67024de4cd6f1b3dd5d39dbe9abe10f627271ae0e322ad40fc8",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "96231c5abcf397996f844e7db30954199eb5b4a407e3b31d6a4ed3ffd75bad2e",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "11510a9de88f729028e2e64b97937305b11780c92777428495851d7211aa6768",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "de1e7dc03b08e7ed0cb08c855f2791e5f8fb48ca89b2a6fdf7b53cd1df48af25",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "96231c5abcf397996f844e7db30954199eb5b4a407e3b31d6a4ed3ffd75bad2e",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "972c1c7cbc276741ceb9e4efc58ad4727e163317d5dcbf350404b84470300271",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "11510a9de88f729028e2e64b97937305b11780c92777428495851d7211aa6768",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "de1e7dc03b08e7ed0cb08c855f2791e5f8fb48ca89b2a6fdf7b53cd1df48af25",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Rocky": {
                        "unknown_versioning": {
                            "dlHash": "a2672426634c0a440500fc473517c6f11ab0c327eab5ccc0bc09b17a88778ef9",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "a2672426634c0a440500fc473517c6f11ab0c327eab5ccc0bc09b17a88778ef9",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "3d67397aa2c4c09fec05ad612453f8d906930dabb4c35c2327b82b8b07d8455a",
                            "dlSubdir": "ghc-9.6.4-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "( >= 13 && < 14 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.6.4/ghc-9.6.4-x86_64-portbld-freebsd13.tar.xz",
                            "dlSubdir": "ghc-9.6.4-x86_64-portbld-freebsd",
                            "dlHash": "c682758b4847ed1433898562fd1b805773cbbcbd8ee1ff8bd777f4da242027d1",
                        },
                        ">= 14": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.6.4/ghc-9.6.4-x86_64-portbld-freebsd14.tar.xz",
                            "dlSubdir": "ghc-9.6.4-x86_64-portbld-freebsd",
                            "dlHash": "552acaa209442f71f922b0a4b57c6f03ec4b8dc5cb35b6231917413c9beb46bf",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.6.4/ghc-9.6.4-x86_64-portbld-freebsd13.tar.xz",
                            "dlSubdir": "ghc-9.6.4-x86_64-portbld-freebsd",
                            "dlHash": "c682758b4847ed1433898562fd1b805773cbbcbd8ee1ff8bd777f4da242027d1",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "25affc9ceb6f2032706ec1b4b7ba5d14bd34df3b5223d8060f210aece25feea9",
                            "dlSubdir": "ghc-9.6.4-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "d430345a66128c858e09dd9a90e5beabc045a9a3cedf776aea3adb45d1286276",
                            "dlSubdir": "ghc-9.6.4-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
        },
        "9.6.5": {
            "viTags": [
                "base-4.18.2.1",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.6.5/docs/users_guide/9.6.5-notes.html",
            "viSourceDL": {
                "dlHash": "87b389924f98c1a26c205122757338c8dab33ad1fcf670faa22622742432b93c",
                "dlSubdir": "ghc-9.6.5",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-src.tar.xz",
            },
            "viTestDL": {
                "dlHash": "dca3df48975cf7917db4e3ff6212e9478ce48337cb1a13e3007a3d1a8009a24c",
                "dlSubdir": "ghc-9.6.5/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-testsuite.tar.xz",
            },
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "<10": {
                            "dlHash": "10f62a735769cc76d035f67dc4bae4a595ec6c746aedec661130f1dce388dd49",
                            "dlSubdir": "ghc-9.6.5-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-i386-deb9-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "10f62a735769cc76d035f67dc4bae4a595ec6c746aedec661130f1dce388dd49",
                            "dlSubdir": "ghc-9.6.5-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "10f62a735769cc76d035f67dc4bae4a595ec6c746aedec661130f1dce388dd49",
                            "dlSubdir": "ghc-9.6.5-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "946b5f0b1d5b09eaeb253e5d80478d71e5fa9c153bb509e65cca8bafc89230c4",
                            "dlSubdir": "ghc-9.6.5-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-i386-linux-alpine-3.17.7.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "f711a4d9f4c7c8857ccc2f867fbe492855a0393a10b457d6aed33dbb2ed0fe2a",
                            "dlSubdir": "ghc-9.6.5-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "ec49f8f2aa8bbf31e34646998b48f283351b9d0fccc2905824b5cf2d0c2fa974",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "1c5abc04f400151c0d0ea6c4676474215b88a957171aa06cf2279eb70263ac66",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "1c5abc04f400151c0d0ea6c4676474215b88a957171aa06cf2279eb70263ac66",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "3851029d4af6353e75f5a6d4055e0a3ab95ad986d71a603901000af048ff106e",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "d37024b8f300098025b3612e210366fcfafd717de3eac9bc29c29f3c280bb6a1",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "8cd8dc9c870540dab142f2dc4eda174a98be7312975696169c363704d8fcf094",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "8cd8dc9c870540dab142f2dc4eda174a98be7312975696169c363704d8fcf094",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "1b8c3c7e8d685cfc5a5c36e24233ea625fbc1540ceec52e908dea669b5bee436",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "1c5abc04f400151c0d0ea6c4676474215b88a957171aa06cf2279eb70263ac66",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "01049e2a8e8e14c6599ddb7c2c3339aefc0e1f81fe281d51edcbed6b395cea7a",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "c848b49ff356349944db32260908269e4e02663daba668b409be0717bf48f103",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c848b49ff356349944db32260908269e4e02663daba668b409be0717bf48f103",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "d37024b8f300098025b3612e210366fcfafd717de3eac9bc29c29f3c280bb6a1",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "01049e2a8e8e14c6599ddb7c2c3339aefc0e1f81fe281d51edcbed6b395cea7a",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c848b49ff356349944db32260908269e4e02663daba668b409be0717bf48f103",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Rocky": {
                        "unknown_versioning": {
                            "dlHash": "5a5cfdaf8a6092aaf9f07b5d0c76f13701537afdbbe67eabb6963cc7c7da3057",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "5a5cfdaf8a6092aaf9f07b5d0c76f13701537afdbbe67eabb6963cc7c7da3057",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "5a5cfdaf8a6092aaf9f07b5d0c76f13701537afdbbe67eabb6963cc7c7da3057",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "c8e17c561823448fb2a4348b86291185e578383a30ceff8c11a297c1a559fd68",
                            "dlSubdir": "ghc-9.6.5-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        ">= 14": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-portbld-freebsd_p1.tar.xz",
                            "dlSubdir": "ghc-9.6.5-x86_64-portbld-freebsd",
                            "dlHash": "3ee365762462ab4729a0939f49ecec7aaa1863873870a830df80b0819eb59784",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-x86_64-portbld-freebsd_p1.tar.xz",
                            "dlSubdir": "ghc-9.6.5-x86_64-portbld-freebsd",
                            "dlHash": "3ee365762462ab4729a0939f49ecec7aaa1863873870a830df80b0819eb59784",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "5bf83b97f818b0a248cb9f7b400110ce22341315250f7de265249ee1f8be7ac8",
                            "dlSubdir": "ghc-9.6.5-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.5/ghc-9.6.5-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "fc4e2df394b9d6f48bdb0abaabad1c97825264cbe4e75e7463fc794cb3f87047",
                            "dlSubdir": "ghc-9.6.5-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.5/ghc-9.6.5-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
        },
        "9.6.6": {
            "viTags": [
                "base-4.18.2.1",
            ],
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.6.6/docs/users_guide/9.6.6-notes.html",
            "viSourceDL": {
                "dlHash": "008f7a04d89ad10baae6486c96645d7d726aaac7e1476199f6dd86c6bd9977ad",
                "dlSubdir": "ghc-9.6.6",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-src.tar.xz",
            },
            "viTestDL": {
                "dlHash": "dd91c6b65bc4b424de273072fb6ae8782a6efa861cf36445cc88fc383455b209",
                "dlSubdir": "ghc-9.6.6/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-testsuite.tar.xz",
            },
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "<10": {
                            "dlHash": "5c09a0e36ea305c422ac259c810d94d0b2223f6929903c86586d2ca3cbd01c9d",
                            "dlSubdir": "ghc-9.6.6-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-i386-deb9-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "5c09a0e36ea305c422ac259c810d94d0b2223f6929903c86586d2ca3cbd01c9d",
                            "dlSubdir": "ghc-9.6.6-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "5c09a0e36ea305c422ac259c810d94d0b2223f6929903c86586d2ca3cbd01c9d",
                            "dlSubdir": "ghc-9.6.6-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-i386-deb9-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "b958a848a24f3d76c926f1fb04254ab9ba5cc4e571f0b49ed62082a39fd06028",
                            "dlSubdir": "ghc-9.6.6-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-i386-alpine3_20-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "4b50f773b0de4b91f8dffe34e9ea2dc061e8594d706a6d3143f05c2a979201d8",
                            "dlSubdir": "ghc-9.6.6-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "a073619c206b71efbe99b1bdfce08af12239b8b2606da6ce91880ede22dd0919",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "a7e91977782dbabb0fcdbd64b5a5095f64d22e1297c8c472183b959da9c4aeab",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "a7e91977782dbabb0fcdbd64b5a5095f64d22e1297c8c472183b959da9c4aeab",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "15ee68cede5d114a672fb468b9545700edd70a68724ab4e9122c8a23aba8570b",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "ff5b4929a4e89c536e7badb3b142e353dc4bda1f31d3ee446406ad88c3bebddf",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "a34bdfc1f65b000135d9c8eb12d69670026a64043a8b33ef5ba24b0f8e28d046",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "a34bdfc1f65b000135d9c8eb12d69670026a64043a8b33ef5ba24b0f8e28d046",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "2364e780b5f017fc384b0669dde40f5a13c45f3a17f4e4db39cad3c4bed806a0",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "a7e91977782dbabb0fcdbd64b5a5095f64d22e1297c8c472183b959da9c4aeab",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "9c3c3bf12a89a155c977c2b8661f180941da57f3e6e8eb33752f36d22261887e",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "f6377a88e1e58b74682345b04401dd20386de43cb37f027f4b54216db7bed5f9",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "f6377a88e1e58b74682345b04401dd20386de43cb37f027f4b54216db7bed5f9",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "ff5b4929a4e89c536e7badb3b142e353dc4bda1f31d3ee446406ad88c3bebddf",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "9c3c3bf12a89a155c977c2b8661f180941da57f3e6e8eb33752f36d22261887e",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "f6377a88e1e58b74682345b04401dd20386de43cb37f027f4b54216db7bed5f9",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Rocky": {
                        "unknown_versioning": {
                            "dlHash": "73f7b138c5008c0cc911be967be4a79ccd167712048303107740cfa7a4e05f3e",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "73f7b138c5008c0cc911be967be4a79ccd167712048303107740cfa7a4e05f3e",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "73f7b138c5008c0cc911be967be4a79ccd167712048303107740cfa7a4e05f3e",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "fc12b7bfc78e69c8c7ebcb9f874f868665e5744df1af73e71cf5224c32d9c6e4",
                            "dlSubdir": "ghc-9.6.6-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        ">= 14": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-portbld-freebsd-p1.tar.xz",
                            "dlSubdir": "ghc-9.6.6-x86_64-portbld-freebsd",
                            "dlHash": "672fd62ee4552cb623081b9493b23c4a4b2819eff38379688948195074eec241",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-x86_64-portbld-freebsd-p1.tar.xz",
                            "dlSubdir": "ghc-9.6.6-x86_64-portbld-freebsd",
                            "dlHash": "672fd62ee4552cb623081b9493b23c4a4b2819eff38379688948195074eec241",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "27ac8ddacb9696117995c13cb98f3c836f2b82440267a6faf425fc244e9a2324",
                            "dlSubdir": "ghc-9.6.6-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "58d5ce65758ec5179b448e4e1a2f835924b4ada96cf56af80d011bed87d91fef",
                            "dlSubdir": "ghc-9.6.6-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.6.6/ghc-9.6.6-aarch64-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.6.6/ghc-9.6.6-aarch64-alpine-linux.tar.xz",
                            "dlSubdir": "ghc-9.6.6-aarch64-alpine-linux",
                            "dlHash": "4f865bdcc71350d65a9f87e2baec1ef37fc4ed7dd6be9bba82744701664152c8",
                        },
                    },
                },
            },
        },
        "9.8.1": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlHash": "f59a9914c3590e30a4ce2b74a205a7390bc5edd0259627036a685da1ccaff7a0",
                            "dlOutput": "ghc-9.8.1-i386-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.8.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "f59a9914c3590e30a4ce2b74a205a7390bc5edd0259627036a685da1ccaff7a0",
                            "dlOutput": "ghc-9.8.1-i386-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.8.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "f59a9914c3590e30a4ce2b74a205a7390bc5edd0259627036a685da1ccaff7a0",
                            "dlOutput": "ghc-9.8.1-i386-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.8.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "f59a9914c3590e30a4ce2b74a205a7390bc5edd0259627036a685da1ccaff7a0",
                            "dlOutput": "ghc-9.8.1-i386-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.8.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "4ae25a6851d0526c8e227a6815be3888f9df9c2fc4507f6537cb38cdc52049f7",
                            "dlSubdir": "ghc-9.8.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.8.1/ghc-9.8.1-i386-alpine-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "1ea10e3b4b81b4159737128434babefff891b68345e48516828547ad8949820e",
                            "dlOutput": "ghc-9.8.1-x86_64-darwin.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.8.1/ghc-9.8.1-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-portbld-freebsd",
                            "dlHash": "cb82a34c59611f02b0ae3398a0a2101966c0ad3ac479215f699d6848f28cfa42",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "d83e28a0ec6d9a88f7d16cdb64e1110cf122a64166b03b84cb87de38f0fb5e78",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-alpine3_12.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "9940f8ac028d210240edf3e788cdd9d568bb77994b740798fe8b3bb84ba74561",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "9940f8ac028d210240edf3e788cdd9d568bb77994b740798fe8b3bb84ba74561",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "d498657ca00514bc4620b591f74b93f9a3b64e5282e5c4e2876a734c130f1fbf",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "9bfd288e495488ac352de045cc8b3bab509070a5b818cc36b2dfe6097dd7c872",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "ca4dde3a6f34f1fe6d0783767671f02e862f1b0222ef2dc2c5c68cc2abc1abae",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "ca4dde3a6f34f1fe6d0783767671f02e862f1b0222ef2dc2c5c68cc2abc1abae",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "dd21379f9d2dfd27817adba94ac1209c03e1c40acc3f499eac94e245a56b5dc6",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "9940f8ac028d210240edf3e788cdd9d568bb77994b740798fe8b3bb84ba74561",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "a9e30db7f2945ffe48de20eb32ad20a534e64f26c908d1feed2e6f3e0a3b467e",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-ubuntu18_04.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "436a34dffafdd0fe2019e973805d479b6a0494f7bd1200502efa95a3c73053b1",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-ubuntu20_04.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "9940f8ac028d210240edf3e788cdd9d568bb77994b740798fe8b3bb84ba74561",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "9bfd288e495488ac352de045cc8b3bab509070a5b818cc36b2dfe6097dd7c872",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "a9e30db7f2945ffe48de20eb32ad20a534e64f26c908d1feed2e6f3e0a3b467e",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-ubuntu18_04.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "436a34dffafdd0fe2019e973805d479b6a0494f7bd1200502efa95a3c73053b1",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-ubuntu20_04.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "3259df634fc8de876224007400ca2eec73831c59a9e55687809b66553a73c5f5",
                            "dlOutput": "ghc-9.8.1-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "eb74654419cb646e9d2e362b57f2f81bc9f5231bceb543b14cb0341aedb07fa3",
                            "dlOutput": "ghc-9.8.1-x86_64-windows.tar.xz",
                            "dlSubdir": "ghc-9.8.1-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "a38bb06f60c92d348e3ee927a4a88e88488f874e99f440d06244a4e4f9db9e3b",
                            "dlOutput": "ghc-9.8.1-aarch64-darwin.tar.xz",
                            "dlSubdir": "ghc-9.8.1-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "aab7af72614f8bf9ca624407aa4dbc69bc009c2b4cc1a0f3c062008db81bdb95",
                            "dlOutput": "ghc-9.8.1-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "ghc-9.8.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.8.1/docs/users_guide/9.8.1-notes.html",
            "viReleaseDay": "2023-10-09",
            "viSourceDL": {
                "dlHash": "b2f8ed6b7f733797a92436f4ff6e088a520913149c9a9be90465b40ad1f20751",
                "dlOutput": "ghc-9.8.1-src.tar.xz",
                "dlSubdir": "ghc-9.8.1",
                "dlUri": "https://downloads.haskell.org/~ghc/9.8.1/ghc-9.8.1-src.tar.xz",
            },
            "viTags": [
                "base-4.19.0.0",
                "old",
            ],
            "viTestDL": {
                "dlHash": "2626f3bb974428cbb795c5433017e18088f0d8de8a66d5a23ff4776847a5bec3",
                "dlSubdir": "ghc-9.8.1/testsuite",
                "dlUri": "https://downloads.haskell.org/ghc/9.8.1/ghc-9.8.1-testsuite.tar.xz",
            },
        },
        "9.8.2": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlHash": "9607b12351ff1bf8771a037fe943f2e23b7b03f8e7cca9c66b555e11f83610b9",
                            "dlSubdir": "ghc-9.8.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "9607b12351ff1bf8771a037fe943f2e23b7b03f8e7cca9c66b555e11f83610b9",
                            "dlSubdir": "ghc-9.8.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "9607b12351ff1bf8771a037fe943f2e23b7b03f8e7cca9c66b555e11f83610b9",
                            "dlSubdir": "ghc-9.8.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "9607b12351ff1bf8771a037fe943f2e23b7b03f8e7cca9c66b555e11f83610b9",
                            "dlSubdir": "ghc-9.8.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "9b3572135a8120a3644649d23e86957ea8adf842cbaa413c37531741000ecc34",
                            "dlSubdir": "ghc-9.8.2-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-i386-linux-alpine-3.17.7.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "0f2671da68ac694cf661ef0bd05eeae27c6200878367e519c427b7da033997ba",
                            "dlSubdir": "ghc-9.8.2-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "888b6b04795be8c72fda46d959032ec4f49b02efa94d87f8e3e25d0daaf6e891",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "ec1b7760c02f855b6809e34cf2077b6a05c9a01a3cf18cf079a060cf1cbac5a5",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "ec1b7760c02f855b6809e34cf2077b6a05c9a01a3cf18cf079a060cf1cbac5a5",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "7449e1c8ef351ec326f36d9eba2885ba7b75d9900df35b2069c4d6fd151b09eb",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "9ff735b0b9dcb0c48cc32d6df7826b6ee9b2fdf1f1e056f015bab9e79fc86c11",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "ee9d424c614dd4b92b0104e812fb92016bf3d3ffd5e51a8af544634b9d817028",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "ee9d424c614dd4b92b0104e812fb92016bf3d3ffd5e51a8af544634b9d817028",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "99639e49179664cf69f533d00ab30da5f7333370a9b9d3c750453a1e51be4f29",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "ec1b7760c02f855b6809e34cf2077b6a05c9a01a3cf18cf079a060cf1cbac5a5",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "d7c473efe9ee81cbf0751b49b58eb95cb3d9a8cea0093b5cc7735d21f9301414",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "a65a4726203c606b58a7f6b714a576e7d81390158c8afa0dece3841a4c602de2",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "9ff735b0b9dcb0c48cc32d6df7826b6ee9b2fdf1f1e056f015bab9e79fc86c11",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "d7c473efe9ee81cbf0751b49b58eb95cb3d9a8cea0093b5cc7735d21f9301414",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "a65a4726203c606b58a7f6b714a576e7d81390158c8afa0dece3841a4c602de2",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "73b1b55f7ce7a93d25b7ba8729940bc8e90039dd402b333b1f903c25300f3409",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "73b1b55f7ce7a93d25b7ba8729940bc8e90039dd402b333b1f903c25300f3409",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlHash": "150468d0d4ece45bb913565a7f3fdd3f4c75af832d70198721083b65c9f863d6",
                            "dlSubdir": "ghc-9.8.2-x86_64-portbld-freebsd",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-x86_64-portbld-freebsd.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "f7d496b850686ea5fbfcecc722ec399ec7acb8d06ebec23bb4dcb9338f430764",
                            "dlSubdir": "ghc-9.8.2-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "7965a118589f578e952d1a6b2c8826bb3fa1624564392db153ae741c35b33204",
                            "dlSubdir": "ghc-9.8.2-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.8.2/ghc-9.8.2-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "0e1a8156ec82de77a7160db023b297cf00ab1e04e395f1e8b77f602ba051b1d5",
                            "dlSubdir": "ghc-9.8.2-aarch64-alpine-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-aarch64-alpine3_18-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "9a3776fd8dc02f95b751f0e44823d6727dea2c212857e2c5c5f6a38a034d1575",
                            "dlSubdir": "ghc-9.8.2-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.8.2/docs/users_guide/9.8.2-notes.html",
            "viReleaseDay": "2024-02-23",
            "viSourceDL": {
                "dlHash": "e2fb7a7dd7461237d22e8365a83edd9e1a77d2e15d045f3945396845a87781c9",
                "dlSubdir": "ghc-9.8.2",
                "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-src.tar.xz",
            },
            "viTags": [
                "base-4.19.1.0",
            ],
            "viTestDL": {
                "dlHash": "e1e35736205f555bceeecd3a78b9e8f0710c51a875149ebf5795eb88deb38a60",
                "dlSubdir": "ghc-9.8.2/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.8.2/ghc-9.8.2-testsuite.tar.xz",
            },
        },
        "9.8.4": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlHash": "e5efce16c654d5e702986258a87dd9531e1722b8051823c8ce1150ce3c5899ae",
                            "dlSubdir": "ghc-9.8.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "e5efce16c654d5e702986258a87dd9531e1722b8051823c8ce1150ce3c5899ae",
                            "dlSubdir": "ghc-9.8.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "e5efce16c654d5e702986258a87dd9531e1722b8051823c8ce1150ce3c5899ae",
                            "dlSubdir": "ghc-9.8.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "e5efce16c654d5e702986258a87dd9531e1722b8051823c8ce1150ce3c5899ae",
                            "dlSubdir": "ghc-9.8.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "f80251ddaf75f22cabfa8add420c1c6f347c0cdfb46d062f7641c210628cc933",
                            "dlSubdir": "ghc-9.8.4-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.8.4/ghc-9.8.4-i386-linux-alpine-3.20.3.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "de7baacfb1513ab0e4ccf8911045cceee84bc8a4e39b89bd975ed3135e5f7d96",
                            "dlSubdir": "ghc-9.8.4-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "e34bb16e8387509adc96a3d98b4a444bab425d12864c38a3629f2860b4bec2e7",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "d2f2da6e93ceaa45a1c820720f75b0d06f624aed2377cc777366be8449dbd17f",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d2f2da6e93ceaa45a1c820720f75b0d06f624aed2377cc777366be8449dbd17f",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "26bc72eb2758a3df14a4a88193d116d2cf334c2a20892b401f5cd3f82e6d346c",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-deb10-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "1ff17998daa7d356801899b2862916c8df53ae57969189419d7709a877fc380c",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "af151db8682b8c763f5a44f960f65453d794c95b60f151abc82dbdefcbe6f8ad",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "af151db8682b8c763f5a44f960f65453d794c95b60f151abc82dbdefcbe6f8ad",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlHash": "5f03d48f118abd30aee37d8bcddc1d7012193ff205b15121807ecd979c4cf947",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d2f2da6e93ceaa45a1c820720f75b0d06f624aed2377cc777366be8449dbd17f",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "e826990bd46a93ff8c87cf279fe1c480d763df4f1140fdf33b26d22ef3e21f06",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "d83941c9be977e7dc1a6f3eca32bc11e01a7cc3e6b678a226856a99e2ae22ce9",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        ">= 8": {
                            "dlHash": "7e10f00bdc9e552d9fc3d330b27681b340b0653df4741983b49937c2b533a5c4",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-rocky8-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d2f2da6e93ceaa45a1c820720f75b0d06f624aed2377cc777366be8449dbd17f",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlHash": "f13aaa33af32e2ffd5c7d222063a9c80be2ca1a311404f38ab99d9612d7babd5",
                            "dlSubdir": "ghc-9.8.4-x86_64-portbld-freebsd",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.8.4/ghc-9.8.4-x86_64-freebsd-14.0.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 19 )": {
                            "dlHash": "e826990bd46a93ff8c87cf279fe1c480d763df4f1140fdf33b26d22ef3e21f06",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d83941c9be977e7dc1a6f3eca32bc11e01a7cc3e6b678a226856a99e2ae22ce9",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "7e10f00bdc9e552d9fc3d330b27681b340b0653df4741983b49937c2b533a5c4",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "184c9184d6439f1da8bca0214011ef6074fb5946eaa5840dc0c3e884515d7c52",
                            "dlSubdir": "ghc-9.8.4-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "e2f12a922754fd28511512875bf6d9eb3e0cce7fc963a7266f6e1661aeabd7ed",
                            "dlSubdir": "ghc-9.8.4-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "15cf9341437af2c6f75bbaf8222824f5b51c32f0637ed054513f165999b0a87d",
                            "dlSubdir": "ghc-9.8.4-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-aarch64-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "b5c86a0cda0bd62d5eeeb52b1937c3bd00c70cd67dd74226ce787d5c429a4e62",
                            "dlSubdir": "ghc-9.8.4-aarch64-alpine-linux",
                            "dlUri": "https://downloads.haskell.org/ghc/9.8.4/ghc-9.8.4-aarch64-alpine3_18-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.8.4/docs/users_guide/9.8.4-notes.html",
            "viReleaseDay": "2024-11-27",
            "viSourceDL": {
                "dlHash": "17e8188f3c8a5c2f73fb4e35d01032e8dc258835ec876d52c8ad8ee3d24b2fc5",
                "dlSubdir": "ghc-9.8.4",
                "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-src.tar.xz",
            },
            "viTags": [
                "base-4.19.2.0",
            ],
            "viTestDL": {
                "dlHash": "4be7906515fc3db6b7c4f85d6e29601accb9153801595fdef1e4ac500a3fd066",
                "dlSubdir": "ghc-9.8.4/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.8.4/ghc-9.8.4-testsuite.tar.xz",
            },
        },
        "9.10.1": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "unknown_versioning": {
                            "dlHash": "5367e692dd9efd9062846334ec6aeeddf186c01b1551b3207649a2ce16f4df76",
                            "dlSubdir": "ghc-9.10.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "5367e692dd9efd9062846334ec6aeeddf186c01b1551b3207649a2ce16f4df76",
                            "dlSubdir": "ghc-9.10.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "5367e692dd9efd9062846334ec6aeeddf186c01b1551b3207649a2ce16f4df76",
                            "dlSubdir": "ghc-9.10.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "5367e692dd9efd9062846334ec6aeeddf186c01b1551b3207649a2ce16f4df76",
                            "dlSubdir": "ghc-9.10.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "bb5065869084a609b7ce302efb5e0bb085c584860fb6718c21be1dd26aeed299",
                            "dlSubdir": "ghc-9.10.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.10.1/ghc-9.10.1-i386-linux-alpine-3.17.7.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "8cf22188930e10d7ac5270d425e21a3dab606af73a655493639345200c650be9",
                            "dlSubdir": "ghc-9.10.1-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.18 )": {
                            "dlHash": "327b424d30524a9d2dfe569e1ef72b8967675c555ce684ef60deec1233e3f4f5",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-alpine3_12-linux.tar.xz",
                        },
                        ">= 3.18": {
                            "dlHash": "d556a6be67ad02000f97c08ef615b7392416e01d64596e7c718df98196520999",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-alpine3_18-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d556a6be67ad02000f97c08ef615b7392416e01d64596e7c718df98196520999",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-alpine3_18-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "b8eb60aa73d512158672e0b22cc673a03fab6130b58c98cb39647c0d521195bc",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.10.1/ghc-9.10.1-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "b8eb60aa73d512158672e0b22cc673a03fab6130b58c98cb39647c0d521195bc",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.10.1/ghc-9.10.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "< 10": {
                            "dlHash": "5c4fb1c2185320afd6b1efaa155f97e956fa782004ce829fb41879ad0fd1cd14",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-deb9-linux.tar.xz",
                        },
                        "(>= 10 && < 11)": {
                            "dlHash": "7fbdca8971c89a54cff8e88aee825c2ef2bcc9f7a050ee1e1e844763e39c361f",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-deb10-linux.tar.xz",
                        },
                        "(>= 11 && < 12)": {
                            "dlHash": "78975575b8125ecf1f50f78b1016b14ea6e87abbf1fc39797af469d029c5d737",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-deb11-linux.tar.xz",
                        },
                        ">= 12": {
                            "dlHash": "330c43eea88434e2de3480e05a5ea5cf7664090ef12245602dfe8463ac5dc496",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-deb12-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "330c43eea88434e2de3480e05a5ea5cf7664090ef12245602dfe8463ac5dc496",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-deb12-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        "(>= 33 && < 38)": {
                            "dlHash": "eef58297f48cae3d8003fd6e8bc295b6e42fe982ad902eada99a72d559384cab",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-fedora33-linux.tar.xz",
                        },
                        ">= 38": {
                            "dlHash": "e728e4f93cbd39eaa99c5f15d7e90affb4310564676a4c5ca698e2f8a53fd482",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-fedora38-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "b8eb60aa73d512158672e0b22cc673a03fab6130b58c98cb39647c0d521195bc",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.10.1/ghc-9.10.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "228241a183e55dd7fcb3988b3f4cd19062df08ad85373b7451df03ba64eb9da2",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "ae3be406fdb73bd2b0c22baada77a8ff2f8cde6220dd591dc24541cfe9d895eb",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "ae3be406fdb73bd2b0c22baada77a8ff2f8cde6220dd591dc24541cfe9d895eb",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "5c4fb1c2185320afd6b1efaa155f97e956fa782004ce829fb41879ad0fd1cd14",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "228241a183e55dd7fcb3988b3f4cd19062df08ad85373b7451df03ba64eb9da2",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "ae3be406fdb73bd2b0c22baada77a8ff2f8cde6220dd591dc24541cfe9d895eb",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "853909835ea9de6db39a0db0d52c01e7f200c816e925895199a1e62ad7c5901f",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlHash": "853909835ea9de6db39a0db0d52c01e7f200c816e925895199a1e62ad7c5901f",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlHash": "f424d789e78185377a48d54c6d0c2ab8337252835b659d4c75b11a5959f6e34a",
                            "dlSubdir": "ghc-9.10.1-x86_64-portbld-freebsd",
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/ghc/9.10.1/ghc-9.10.1-x86_64-portbld-freebsd.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "8bac01906ec2fa5c10c730b5ee5b8165654d654dbaf25ba9d3c42f8e26484c6a",
                            "dlSubdir": "ghc-9.10.1-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "ffaf83b5d7a8b2c04920c6e3909c0be21dde27baf380d095fa27e840a3a2e804",
                            "dlSubdir": "ghc-9.10.1-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "6ad63714932c8acd9ed85ac1bacd31a27c888f259dd0d95a70d143dfd25fd863",
                            "dlSubdir": "ghc-9.10.1-aarch64-alpine-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-aarch64-alpine3_18-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlHash": "e6df50e62b696e3a8b759670fc79207ccc26e88a79a047561ca1ccb8846157dd",
                            "dlSubdir": "ghc-9.10.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-aarch64-deb10-linux.tar.xz",
                        },
                        ">= 11": {
                            "dlHash": "1db449c445d34779d4deaba22341576f7b512a05b6c2b5cb64f3846d1509714e",
                            "dlSubdir": "ghc-9.10.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-aarch64-deb11-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "1db449c445d34779d4deaba22341576f7b512a05b6c2b5cb64f3846d1509714e",
                            "dlSubdir": "ghc-9.10.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-aarch64-deb11-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "e6df50e62b696e3a8b759670fc79207ccc26e88a79a047561ca1ccb8846157dd",
                            "dlSubdir": "ghc-9.10.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.10.1/docs/users_guide/9.10.1-notes.html",
            "viSourceDL": {
                "dlHash": "bf386a302d4ee054791ffd51748900f15d71760fd199157922d120cc1f89e2f7",
                "dlSubdir": "ghc-9.10.1",
                "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-src.tar.xz",
            },
            "viTags": [
                "base-4.20.0.0",
            ],
            "viTestDL": {
                "dlHash": "bc03b1ec1f843bb5471003678f3d8de6d6625ee6a67db8c6cc2efaaea55206e1",
                "dlSubdir": "ghc-9.10.1/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.10.1/ghc-9.10.1-testsuite.tar.xz",
            },
        },
        "9.12.1": {
            "viArch": {
                "A_32": {
                    "Linux_Debian": {
                        "( >= 10 && < 12 )": {
                            "dlHash": "1e04fb8e6f177a8d72f99b6f7e60056f5531a501a16a29355c25f629a1662d66",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-i386-deb10-linux.tar.xz",
                        },
                        ">= 12": {
                            "dlHash": "454b7d7c344f14805d0efc4f0bc70914b16ce7e960d61538470ac2da7526904c",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-i386-deb12-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "454b7d7c344f14805d0efc4f0bc70914b16ce7e960d61538470ac2da7526904c",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-i386-deb12-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "unknown_versioning": {
                            "dlHash": "1e04fb8e6f177a8d72f99b6f7e60056f5531a501a16a29355c25f629a1662d66",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlHash": "1e04fb8e6f177a8d72f99b6f7e60056f5531a501a16a29355c25f629a1662d66",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "1e04fb8e6f177a8d72f99b6f7e60056f5531a501a16a29355c25f629a1662d66",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-i386-deb10-linux.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "55f52a02ed3f9d7b6dd532fb092e528ac710cab995662d5bee483177cafd1524",
                            "dlSubdir": "ghc-9.12.1-i386-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.12.1/ghc-9.12.1-i386-alpine-linux.tar.xz",
                        },
                    },
                },
                "A_64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "e6eb460ce2ddd87691c06a0a128adb45b70f339b999dcf845bc1b146f13879f1",
                            "dlSubdir": "ghc-9.12.1-x86_64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.20 )": {
                            "dlHash": "f08750616c2e9cd14d7e600637a6ceaf91338a8e6777b2a44d174d31ccd29203",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-alpine3_12-linux.tar.xz",
                        },
                        ">= 3.20": {
                            "dlHash": "43a61b01b985e299e7fab9db6211ecc153124a480262af39c6f769a6e3ff7eb4",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-alpine3_20-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "f08750616c2e9cd14d7e600637a6ceaf91338a8e6777b2a44d174d31ccd29203",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-alpine3_12-linux.tar.xz",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlHash": "49509117c488e4ae3c710276cab14a157b4e3799aa6e3dbf85f9dba118f110c7",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.12.1/ghc-9.12.1-x86_64-centos7-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "49509117c488e4ae3c710276cab14a157b4e3799aa6e3dbf85f9dba118f110c7",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.12.1/ghc-9.12.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "( >= 10 && < 11 )": {
                            "dlHash": "55a705fe026f421df829c479a19751f989876f4c2881bff0d28b52c725a9ad45",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-deb10-linux.tar.xz",
                        },
                        "( >= 11 && < 12 )": {
                            "dlHash": "bbf763bbebffb93535f5c8a12253d303227bd7c90c2be872fce303e83d21b5cf",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-deb11-linux.tar.xz",
                        },
                        "< 10": {
                            "dlHash": "7c08fcf9dcd1081e3b084a63cd257258021cc76543c0293f14df72c9606b8275",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-deb9-linux.tar.xz",
                        },
                        ">= 12": {
                            "dlHash": "2ac4edd78d0a1e0d3b9b961e03fbde51e3012f5a4a1c524557d919edbde3b828",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-deb12-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "2ac4edd78d0a1e0d3b9b961e03fbde51e3012f5a4a1c524557d919edbde3b828",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-deb12-linux.tar.xz",
                        },
                    },
                    "Linux_Fedora": {
                        "(>= 33 && < 38)": {
                            "dlHash": "a60c5754621c535293779dbcd53b698bb21780e498cf5dbd721e8361c392e791",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-fedora33-linux.tar.xz",
                        },
                        ">= 38": {
                            "dlHash": "b7e31bf2f7036cd8f81f5cb51ffe5a830ecf023ff634f21e9b435c2152a4548a",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/ghc/9.12.1/ghc-9.12.1-x86_64-fedora38-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "49509117c488e4ae3c710276cab14a157b4e3799aa6e3dbf85f9dba118f110c7",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.12.1/ghc-9.12.1-x86_64-centos7-linux.tar.xz",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlHash": "f871a8e225ed366fade5c2cdd021b7776dd333262e63a3a91ad084703f26bb85",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        ">= 20": {
                            "dlHash": "d88379492ce2a5c14c0db1f2d7fc980b40cb44e4b7026e347b72efe2224600ec",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "d88379492ce2a5c14c0db1f2d7fc980b40cb44e4b7026e347b72efe2224600ec",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                    },
                    "Linux_RedHat": {
                        "< 9": {
                            "dlHash": "49509117c488e4ae3c710276cab14a157b4e3799aa6e3dbf85f9dba118f110c7",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.12.1/ghc-9.12.1-x86_64-centos7-linux.tar.xz",
                        },
                        ">= 9": {
                            "dlHash": "a60c5754621c535293779dbcd53b698bb21780e498cf5dbd721e8361c392e791",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-fedora33-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "a60c5754621c535293779dbcd53b698bb21780e498cf5dbd721e8361c392e791",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-fedora33-linux.tar.xz",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlHash": "7c08fcf9dcd1081e3b084a63cd257258021cc76543c0293f14df72c9606b8275",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-deb9-linux.tar.xz",
                        },
                        "( >= 18 && < 19 )": {
                            "dlHash": "f871a8e225ed366fade5c2cdd021b7776dd333262e63a3a91ad084703f26bb85",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu18_04-linux.tar.xz",
                        },
                        "( >= 19 && < 21 )": {
                            "dlHash": "d88379492ce2a5c14c0db1f2d7fc980b40cb44e4b7026e347b72efe2224600ec",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu20_04-linux.tar.xz",
                        },
                        "( >= 21 )": {
                            "dlHash": "0974caa386aa1d5431648d398b035e68feab2e0783dd9706ce56cff92971a788",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu22_04-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "0974caa386aa1d5431648d398b035e68feab2e0783dd9706ce56cff92971a788",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-ubuntu22_04-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "f1d08487d704cd5403e77bbedd1b635a0f42dedef82e14fcb8d46c437c7b9d71",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-rocky8-linux.tar.xz",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlHash": "22dc942be1b968d5e28e75c06aba52829d0c52d9234bc9941df9ab2a0e2a610d",
                            "dlSubdir": "ghc-9.12.1-x86_64-unknown-mingw32",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-x86_64-unknown-mingw32.tar.xz",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlHash": "1003d793a1d4183b409b74c734a68b56a924061cfc1b55c9a24342c3627d61ae",
                            "dlSubdir": "ghc-9.12.1-x86_64-portbld-freebsd",
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/ghc/9.12.1/ghc-9.12.1-x86_64-portbld-freebsd.tar.xz",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlHash": "3e7fe66494cf04c86477f7946167fd7de61b54459a68d6ff8c275594b01e0bc7",
                            "dlSubdir": "ghc-9.12.1-aarch64-apple-darwin",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-aarch64-apple-darwin.tar.xz",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlHash": "df2955788280b5a1582a3f4e4bb368d906642f504835489c97dd0cb8e9cee4b3",
                            "dlSubdir": "ghc-9.12.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-aarch64-alpine3_18-linux.tar.xz",
                        },
                    },
                    "Linux_Debian": {
                        "( >= 10 && < 12 )": {
                            "dlHash": "0eb47b7e410443a8a854fce567afc1d4c3889e17619c59eef4803ba3391b14e8",
                            "dlSubdir": "ghc-9.12.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-aarch64-deb10-linux.tar.xz",
                        },
                        "( >= 12 )": {
                            "dlHash": "c5416f383f27815060f6a1940d6afe1b6544168d7bd63f75c9052bd98cef4af5",
                            "dlSubdir": "ghc-9.12.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-aarch64-deb12-linux.tar.xz",
                        },
                        "unknown_versioning": {
                            "dlHash": "c5416f383f27815060f6a1940d6afe1b6544168d7bd63f75c9052bd98cef4af5",
                            "dlSubdir": "ghc-9.12.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-aarch64-deb12-linux.tar.xz",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlHash": "0eb47b7e410443a8a854fce567afc1d4c3889e17619c59eef4803ba3391b14e8",
                            "dlSubdir": "ghc-9.12.1-aarch64-unknown-linux",
                            "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-aarch64-deb10-linux.tar.xz",
                        },
                    },
                },
            },
            "viChangeLog": "https://downloads.haskell.org/~ghc/9.12.1/docs/users_guide/9.12.1-notes.html",
            "viReleaseDay": "2024-12-15",
            "viSourceDL": {
                "dlHash": "4a7410bdeec70f75717087b8f94bf5a6598fd61b3a0e1f8501d8f10be1492754",
                "dlSubdir": "ghc-9.12.1",
                "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-src.tar.xz",
            },
            "viTags": [
                "Latest",
                "base-4.21.0.0",
            ],
            "viTestDL": {
                "dlHash": "c6f1503dd0dc392285f9da7371822ce4ec42d1af96c7802669e0c220462460c5",
                "dlSubdir": "ghc-9.12.1/testsuite",
                "dlUri": "https://downloads.haskell.org/~ghc/9.12.1/ghc-9.12.1-testsuite.tar.xz",
            },
        },
    },
    "Cabal": {
        "2.4.1.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/changelog",
            "viArch": {
                "A_64": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/cabal-install-2.4.1.0-x86_64-alpine-linux-musl.tar.xz",
                            "dlSubdir": None,
                            "dlHash": "720bef015f834a03deb7180be2952a44e7c2e6c8429137570404c3de4f46b984",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/cabal-install-2.4.1.0-x86_64-unknown-linux.tar.xz",
                            "dlSubdir": None,
                            "dlHash": "6136c189ffccaa39916f9cb5788f757166444a2d0c473b987856a79ecbf0c714",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/cabal-install-2.4.1.0-x86_64-apple-darwin-sierra.tar.xz",
                            "dlSubdir": None,
                            "dlHash": "56361cf4b0d920fe23174751fea1fb82a8e1ce522bd9706a3fbe47a72e458c9c",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/cabal-install-2.4.1.0-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": None,
                            "dlHash": "33b7d37ea0688c93436eac9ec139d9967687875aa1fa13f2bb73bf05a9a59a1d",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/cabal-install-2.4.1.0-x86_64-unknown-mingw32.zip",
                            "dlSubdir": None,
                            "dlHash": "95f233efedb1ebf0e6db015fa2f55c1ed00b9938d207ec63c066f706fb4b6373",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-2.4.1.0/cabal-install-2.4.1.0-i386-unknown-linux.tar.xz",
                            "dlSubdir": None,
                            "dlHash": "b2da736cc27609442b10f77fc1a687aba603a7a33045b722dbf1a0066fade198",
                        },
                    },
                },
            },
        },
        "3.0.0.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/changelog",
            "viArch": {
                "A_64": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-x86_64-alpine-linux-musl.tar.xz",
                            "dlHash": "2b7ea63601e11a0db2941b96e6a7036a48efc2a1ab3849d7dfce08b45f5daa58",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-x86_64-unknown-linux.tar.xz",
                            "dlHash": "ee911ba67a70756eedeac662955b896d7e89432a99372aa45d2c6e71fa95a5e4",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-x86_64-apple-darwin17.7.0.tar.xz",
                            "dlHash": "d4857e068560515e4cbb0e8ca124c370e07892f2a28804d87152834e5fe2b845",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "2240842ab2ae7b955feb8b526aba1c7991248c803383107adf39990441294d2a",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-x86_64-unknown-mingw32.zip",
                            "dlSubdir": None,
                            "dlHash": "8889963ebef5e829d86329fdb59832c107efd117cf7862a605f2fe2d2360de1f",
                        },
                    },
                },
                "A_32": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-i386-alpine-linux-musl.tar.xz",
                            "dlHash": "ac018f061993d40bf146517e32629bcab274b4d9f5527b1c37a665ebdf3f5ac6",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.0.0.0/cabal-install-3.0.0.0-i386-unknown-linux.tar.xz",
                            "dlHash": "6898ccd6e6dc0872999c06daaf61d546164e12f60a1880d09852c9f0c59c5cf6",
                        },
                    },
                },
            },
        },
        "3.2.0.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/changelog",
            "viArch": {
                "A_64": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-x86_64-alpine-linux-musl.tar.xz",
                            "dlHash": "8bae37a1ce8b5f10440b5591fed734935e1411c1b765258325ffe268e2cc2042",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-x86_64-unknown-linux.tar.xz",
                            "dlHash": "32d1f7cf1065c37cb0ef99a66adb405f409b9763f14c0926f5424ae408c738ac",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-x86_64-apple-darwin17.7.0.tar.xz",
                            "dlHash": "9197c17d2ece0f934f5b33e323cfcaf486e4681952687bc3d249488ce3cbe0e9",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "f1e35151cca91541b0fb4bdb3ed18f3c348038eab751845ad19c11307d66c273",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-x86_64-unknown-mingw32.zip",
                            "dlSubdir": None,
                            "dlHash": "17778c3ade0482bc37f451eec326f8fce8fbe1f12b1d6aacb2e2b9e34786c054",
                        },
                    },
                },
                "A_32": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-i386-alpine-linux-musl.tar.xz",
                            "dlHash": "c2a419dedf730987b60daf8d24e871d115a09ea608d740d7c61b36e3f5b9c830",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-i386-unknown-linux.tar.xz",
                            "dlHash": "2b3ac28549916de5f3379241797eaf60e84b6c001f2abbe73d9fadbbaf768e93",
                        },
                    },
                },
            },
        },
        "3.4.0.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.4.0.0.md",
            "viArch": {
                "A_64": {
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-x86_64-ubuntu-16.04.tar.xz",
                            "dlHash": "cf28f9ffd763476aa2b1730d85cbf155d366fac541f78ee3951e8cb2d6de63e6",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-x86_64-alpine-3.11.6-static-noofd.tar.xz",
                            "dlHash": "c74073fe79110946182e522fcadc8dcabf07c87583e8cf7801ed4e0c327241f6",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-x86_64-ubuntu-16.04.tar.xz",
                            "dlHash": "cf28f9ffd763476aa2b1730d85cbf155d366fac541f78ee3951e8cb2d6de63e6",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-x86_64-darwin-sierra.tar.xz",
                            "dlHash": "cb10be9a53e856aa2d852fd88fb6944f138783ffe0ea84d93c9a69244e34ea91",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-x86_64-freebsd-12.1-release.tar.xz",
                            "dlHash": "a1e2db664ec00e42a1e071a4181f6476f6e0bad321f1ddc0cf27831119f4c6d4",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.0.0/cabal-install-3.4.0.0-x86_64-windows.zip",
                            "dlSubdir": None,
                            "dlHash": "c898496b199a3ebf41fb399c12a0cb55a470a67e758cee4b08b9f304c4be6979",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.0.0/cabal-install-3.4.0.0-i386-unknown-linux.tar.xz",
                            "dlHash": "cc62a471e9e68a6a9933e54f75bf0cffae67a1d2220df1152ab887c38eb6bc8a",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.0.0/cabal-install-3.4.0.0-i386-unknown-linux.tar.xz",
                            "dlHash": "cc62a471e9e68a6a9933e54f75bf0cffae67a1d2220df1152ab887c38eb6bc8a",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.0.0/cabal-install-3.4.0.0-aarch64-ubuntu-18.04.tar.xz",
                            "dlHash": "04d378347896dfdc3510b192b97489815cfa5d692f46e2758da0f789e682b8f0",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.0.0/cabal-install-3.4.0.0-aarch64-darwin-big-sur.tar.xz",
                            "dlHash": "46d8f96446a6bcdb81b3a9fbc14b137dc4f08436b46fe6446c5fba7bcb9b3d75",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.0.0/cabal-install-3.4.0.0-armv7-linux-bootstrapped.tar.xz",
                            "dlHash": "16c0d1eaba24bed14f3e152970179a45d9f9bb5cc839b2c210ad06eb7d4826ed",
                        },
                    },
                },
            },
        },
        "3.4.1.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.4.1.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.1.0/cabal-install-3.4.1.0-x86_64-linux-alpine-static.tar.xz",
                            "dlHash": "f8cae8b5e6346b56676f734de1afd9b4b5f27eab6ab87852c19a30f7850f17fe",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.1.0/cabal-install-3.4.1.0-x86_64-linux-alpine-static.tar.xz",
                            "dlHash": "f8cae8b5e6346b56676f734de1afd9b4b5f27eab6ab87852c19a30f7850f17fe",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.1.0/cabal-install-3.4.1.0-x86_64-darwin.tar.xz",
                            "dlHash": "c45f9503a60cb580c0ef13c7d9c0069fb953ee4c173835454d1e8f708ed2b574",
                        },
                    },
                    "FreeBSD": {
                        "( >= 12 && < 13 )": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.1.0/cabal-install-3.4.1.0-x86_64-freebsd12.tar.xz",
                            "dlHash": "54563fb7624d871dec0d852c156f4826e31078def99d376bbebb4d066d3aa7ae",
                        },
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.1.0/cabal-install-3.4.1.0-x86_64-freebsd13.tar.xz",
                            "dlHash": "3cc9e9a8f9dadcb97b777907bb884042edc5a2f89c81a782b086554a48852506",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.1.0/cabal-install-3.4.1.0-x86_64-windows.zip",
                            "dlSubdir": None,
                            "dlHash": "b86761a55a0899e33b6e9b64c75a52b33716430de93ea47bfd07d8f11417e800",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.1.0/cabal-install-3.4.1.0-i386-linux-alpine.tar.xz",
                            "dlHash": "7622c64b9382443a43494a992c836654d6554110acf34a4331271e1b438e2ab8",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.1.0/cabal-install-3.4.1.0-i386-linux-alpine.tar.xz",
                            "dlHash": "7622c64b9382443a43494a992c836654d6554110acf34a4331271e1b438e2ab8",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.1.0/cabal-install-3.4.1.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "67a7d253e2f4069d47c321fb1b72ca8156e7387a05801417569b95c2654e18ce",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.4.1.0/cabal-install-3.4.1.0-aarch64-darwin.tar.xz",
                            "dlHash": "f1fb07f1e385ef12d6c3a26ee6caa5223463b095373f1ea1ef74ab5922b0302f",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.4.1.0/cabal-install-3.4.1.0-armv7-linux-deb10.tar.xz",
                            "dlHash": "7c5b75ded319629ff47b17dd283b90ad1ba2635cf65c1a0d2b5be9610e843968",
                        },
                    },
                },
            },
        },
        "3.6.0.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.6.0.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.0.0/cabal-install-3.6.0.0-x86_64-linux.tar.xz",
                            "dlHash": "bfcb7350966dafe95051b5fc9fcb989c5708ab9e78191e71fc04647061668a11",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.0.0/cabal-install-3.6.0.0-x86_64-linux-alpine.tar.xz",
                            "dlHash": "3203d71b7ee87fc9dce74b452ae07f420afe8817b5e6f84e54798442f4ccdda8",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.0.0/cabal-install-3.6.0.0-x86_64-darwin.tar.xz",
                            "dlHash": "8e1367a4a1fc86ff0fd82ee057320a7b974595ba7999457b42035467ba06190c",
                        },
                    },
                    "FreeBSD": {
                        "( >= 12 && < 13 )": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.0.0/cabal-install-3.6.0.0-x86_64-freebsd.tar.xz",
                            "dlHash": "56b5b37396c16a29f164a6963f24bd88f09e1d37448542ed61a683325f0a868b",
                        },
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.0.0/cabal-install-3.6.0.0-x86_64-freebsd13.tar.xz",
                            "dlHash": "a283aa498702a3e286aa08e004c2a389538cbb47ec7096a25682fb7d57f6bb7f",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.0.0/cabal-install-3.6.0.0-x86_64-windows.zip",
                            "dlSubdir": None,
                            "dlHash": "8222b49b6eac3d06aaa390bc688f467e8f949a38943567f46246f8320fd72ded",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.0.0/cabal-install-3.6.0.0-i386-linux.tar.gz",
                            "dlHash": "f2fcef4a212906379a255e12c853f1d015fa22c867764bd7f6e09c6f656b3c75",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.0.0/cabal-install-3.6.0.0-i386-linux.tar.gz",
                            "dlHash": "f2fcef4a212906379a255e12c853f1d015fa22c867764bd7f6e09c6f656b3c75",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.0.0/cabal-install-3.6.0.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "534f71cd4e1d9758dc73066cc5733c5838874710aeb3aa88541de6c6d042d9ec",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.0.0/cabal-install-3.6.0.0-aarch64-darwin-big-sur.tar.xz",
                            "dlHash": "7acf740946d996ede835edf68887e6b2f1e16d1b95e94054d266463f38d136d9",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.0.0/cabal-install-3.6.0.0-armv7-linux.tar.xz",
                            "dlHash": "11b5ca042a8bf45971224f2127a3e9d6b803f09210042ca80a254bea06f01a2e",
                        },
                    },
                },
            },
        },
        "3.6.2.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.6.2.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.0/cabal-install-3.6.2.0-x86_64-linux-alpine-static.tar.xz",
                            "dlHash": "7810d31f35ca7649355647abc6406ad2a3696648ce848e49409e86bd70f6a2c6",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.0/cabal-install-3.6.2.0-x86_64-linux-alpine-static.tar.xz",
                            "dlHash": "7810d31f35ca7649355647abc6406ad2a3696648ce848e49409e86bd70f6a2c6",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-x86_64-darwin.tar.xz",
                            "dlHash": "d616284712f052e599cf1940b10fa2dca4fc6ae1308c32db03f5bd2c23eb2419",
                        },
                    },
                    "FreeBSD": {
                        "( >= 12 && < 13 )": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-x86_64-freebsd12.tar.xz",
                            "dlHash": "eaabbc6f6f4782ad21f8df95d1902eb29b66d8fafe6c8278aaa3d48da772aecb",
                        },
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-x86_64-freebsd13.tar.xz",
                            "dlHash": "b22965d2cc70061e6efb3b4a0e901906c83fb448810e79aca97b9e61bce22692",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-x86_64-windows.zip",
                            "dlSubdir": None,
                            "dlHash": "89aa3aa3f76d15182c0d03227639890cd537627ba0bf0ef9ab451fee504b24c6",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.0/cabal-install-3.6.2.0-i386-linux-alpine.tar.xz",
                            "dlHash": "902b15de4ec5935474c62a72b373a76f727684449d7425996f0ad067a5481bd0",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.0/cabal-install-3.6.2.0-i386-linux-alpine.tar.xz",
                            "dlHash": "902b15de4ec5935474c62a72b373a76f727684449d7425996f0ad067a5481bd0",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "d9acee67d4308bc5c22d27bee034d388cc4192a25deff9e7e491e2396572b030",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-aarch64-darwin.tar.xz",
                            "dlHash": "859c526cde4498879a935e38422d3a0b70ae012dff034913331be8dd429a4a74",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.0/cabal-install-3.6.2.0-armv7-linux-deb10.tar.xz",
                            "dlHash": "694ba7c14f8d720c6e790ab0488dbff2d8a07d9c6de97b4deeba31088f825bc2",
                        },
                    },
                },
            },
        },
        "3.6.2.0-p1": {
            "viTags": [],
            "viPostInstall": "This is a distributor release to fix https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nThe applied downstream patches can be viewed here: https://github.com/hasufell/cabal/tree/cabal-install-v3.6.2.1\nUpstream PR: https://github.com/haskell/cabal/issues/9451\nYou can alternatively update to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.6.2.0.md",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-deb9.tar.xz",
                            "dlHash": "a0153fa499a5e128a02e9bfe7c2e8430bfa211d06f361c721301dbf4c6713029",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-deb10.tar.xz",
                            "dlHash": "ab3ffb77d9816e9f7f62b49ed0565ec2da40c1a77687eb50d7124e9c90451edc",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-deb11.tar.xz",
                            "dlHash": "4b0040cee9c2a66d857c4e2ff592cfad8829bf634ca61726b1f3d9a153e2c31d",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-deb9.tar.xz",
                            "dlHash": "a0153fa499a5e128a02e9bfe7c2e8430bfa211d06f361c721301dbf4c6713029",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlHash": "14537deb62927e77735776609cad4453541c5e8435d7fc647387cc35378a65b9",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlHash": "83a692864bf9a69f63b7c77a4c64580bfaede5abe1b77496c91c8fad2e581088",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "96f1686d8be78467e94e2db4b5629ed534f6510b923b1e08dbab224a32000d87",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-mint19.3.tar.xz",
                            "dlHash": "fadd44997edabea59a1e2282948e5fc052bba866772ce90a8221e915f2dbc6f7",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-mint20.2.tar.xz",
                            "dlHash": "1788e8eb4dbc5e52a39519031590713e6e666e7a50109aa6d8d9ded93e723a2a",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "96f1686d8be78467e94e2db4b5629ed534f6510b923b1e08dbab224a32000d87",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-fedora27.tar.xz",
                            "dlHash": "22d49c9c888a331eb33cebe861a93c5af1a52abf22c785767e4ebec8ce3d4b56",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "e03530b5158a34f9cf2d218a67249f34c69852276b880a52c19bb0b5905b8afd",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-fedora27.tar.xz",
                            "dlHash": "22d49c9c888a331eb33cebe861a93c5af1a52abf22c785767e4ebec8ce3d4b56",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-centos7.tar.xz",
                            "dlHash": "01493a513b7ead376ff49f990cc5708dccfe30e553a2870407edbe8e15b98a8a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-centos7.tar.xz",
                            "dlHash": "01493a513b7ead376ff49f990cc5708dccfe30e553a2870407edbe8e15b98a8a",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-centos7.tar.xz",
                            "dlHash": "01493a513b7ead376ff49f990cc5708dccfe30e553a2870407edbe8e15b98a8a",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "5966d7cadb0a5ddc9e3129e0e5e1af32943aa96139c208aa11634f0865427d1a",
                        },
                    },
                    "Linux_Rocky": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "cca053ccab20975edfb1e03c62d47589a3e0c13e1e25d011f4b5b62c25e546c1",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "5966d7cadb0a5ddc9e3129e0e5e1af32943aa96139c208aa11634f0865427d1a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-apple-darwin.tar.xz",
                            "dlHash": "e2712b3ad32f407536856376852a0fc829c89ec5feddb77afe64d0c2dbf4450f",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-mingw64.zip",
                            "dlHash": "cb9e4f1bd4b51f7fe979a74142f7511fec581a1cfb4b34815b9b90fe37b88c5c",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "d3b2c77806a7d29d663cef1f22a2125b88f84a3f4bc314daab211a8b4d269238",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-i386-linux-unknown.tar.xz",
                            "dlHash": "b06f89f7390c8642adb248fd7c60cbfd46835541cd0c8d0d8a9a1bdd3d12517b",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-i386-linux-unknown.tar.xz",
                            "dlHash": "b06f89f7390c8642adb248fd7c60cbfd46835541cd0c8d0d8a9a1bdd3d12517b",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-aarch64-linux-deb10.tar.xz",
                            "dlHash": "aaa46b30dc8ab4b9fe45bf461a8a3b8c3f0e2d21716d224986ecee86f7172c5d",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-aarch64-apple-darwin.tar.xz",
                            "dlHash": "43bdb9a91e8993d9b4bbfc9d06df9aa817777d09b39a53642ffcf1be21f9efad",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.6.2.1/cabal-install-3.6.2.1-armv7-linux-deb10.tar.xz",
                            "dlHash": "3d309b79c7dd5f0b578b2a297104c626b9c0e49c2c5a558b2d49564726f40c5b",
                        },
                    },
                },
            },
        },
        "3.8.1.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.8.1.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-x86_64-linux-alpine.tar.xz",
                            "dlHash": "4c5626115ca8d3eaba0f6a79a364952a2403a03a459dd6e247a96546cdd50836",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-x86_64-linux-alpine.tar.xz",
                            "dlHash": "4c5626115ca8d3eaba0f6a79a364952a2403a03a459dd6e247a96546cdd50836",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-x86_64-darwin.tar.xz",
                            "dlHash": "f5ff69127b0e596b0d7895a2b0b383543aa92ae46d9b1b28f2868d2a97ed0de9",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.8.1.0/x86_64-portbld-freebsd-cabal-3.8.1.0.tar.xz",
                            "dlHash": "68682427315281cb0efca6aab4edad5c0aa6de979795ed861fac8546dbbf437a",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-x86_64-windows.zip",
                            "dlSubdir": None,
                            "dlHash": "b6dd6afe0e5a883f84dc52d836af0e90d9cd2b2978dd87200332085ecb4a0315",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.8.1.0/i386-linux-cabal-3.8.1.0.tar.xz",
                            "dlHash": "e870d3d619b4a338ba0279682fcda2c8379112daab716e1eebe3e9abb306846a",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.8.1.0/i386-linux-cabal-3.8.1.0.tar.xz",
                            "dlHash": "e870d3d619b4a338ba0279682fcda2c8379112daab716e1eebe3e9abb306846a",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "c7fa9029f2f829432dd9dcf764e58605fbb7431db79234feb3e46684a9b37214",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.8.1.0/cabal-install-3.8.1.0-aarch64-darwin.tar.xz",
                            "dlHash": "f75b129c19cf3aa88cf9885cbf5da6d16f9972c7f770c528ca765b9f0563ada3",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.8.1.0/armv7-linux-cabal-3.8.1.0.tar.xz",
                            "dlHash": "836d89aa1c98a3a848b8b691f9b99123f260dcd4cc1163cb77435a31559475fe",
                        },
                    },
                },
            },
        },
        "3.10.1.0": {
            "viTags": [
                "old",
            ],
            "viPostInstall": "This release is vulnerable: https://github.com/haskell/security-advisories/blob/main/advisories/hackage/cabal-install/HSEC-2023-0015.md\nUpdate to 3.10.2.0 or later.\n",
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.10.1.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-x86_64-linux-alpine.tar.xz",
                            "dlHash": "187fa3d6e69bd8647aea121e469a1c8e4688a704ab88df54e9547c571e1cdd99",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-x86_64-linux-alpine.tar.xz",
                            "dlHash": "187fa3d6e69bd8647aea121e469a1c8e4688a704ab88df54e9547c571e1cdd99",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-x86_64-darwin.tar.xz",
                            "dlHash": "893a316bd634cbcd08861306efdee86f66ec634f9562a8c59dc616f7e2e14ffa",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-x86_64-windows.zip",
                            "dlHash": "31ca1cd173d4da675bc9790746d6b492cbe204e0332b282141d7ecc8ae43997b",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.1.0/cabal-install-3.10.1.0-x86_64-freebsd12.tar.xz",
                            "dlHash": "135334d4fd6fb6c6afcef17bb54d9c417629ab3f9463814ef9f97e71f3055d90",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-i386-linux-deb9.tar.xz",
                            "dlHash": "3c4a43a3ac1ef80e66953c2a8f83bb51298c21aeb7328ce06534600a7259a866",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.1.0/cabal-install-3.10.1.0-i386-linux-alpine.tar.xz",
                            "dlHash": "9dc0b010bcf4257d6248214359b38f389593dfce54c151d09678ad25e2ee4b22",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~cabal/cabal-install-3.10.1.0/cabal-install-3.10.1.0-aarch64-darwin.tar.xz",
                            "dlHash": "fdabdc4dca42688a97f2b837165af42fcfd4c111d42ddb0d4df7bbebd5c8750e",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.1.0/cabal-install-3.10.1.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "e2eb5f4aa574266374be4ee06e67c10447794e1fca7ca7e6dc0e17f77a635553",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.1.0/cabal-install-3.10.1.0-armv7-linux-deb10.tar.xz",
                            "dlHash": "79869dd72cb0a6f90f2e1e0e57af4ea6ee09b041550abc09252d1cf309b4f96e",
                        },
                    },
                },
            },
        },
        "3.10.2.0": {
            "viPostInstall": "cabal run is currently partially broken on Windows, please see https://github.com/haskell/cabal/issues/9334",
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.10.2.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-alpine3_12.tar.xz",
                            "dlHash": "b54e1cd235c47c62c03cdb9f6cf90e5fe8ae38c5e5befb9e21c8d1395f4bde05",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-alpine3_12.tar.xz",
                            "dlHash": "b54e1cd235c47c62c03cdb9f6cf90e5fe8ae38c5e5befb9e21c8d1395f4bde05",
                        },
                    },
                    "Linux_CentOS": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "cfcdab399380dec7fedda55898bff975ac30b5d5d579433cbf8773b17c15f410",
                        },
                    },
                    "Linux_Debian": {
                        " ( >= 9 && < 10)": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "af5ce42114cf7720c37fee3238781df4c75bb74914c62e6a68833fb434e0cad7",
                        },
                        " ( == 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-deb10.tar.xz",
                            "dlHash": "bdeb27c008b09c3b86f8a2768018d62a1aee02565304d123fda87ed432549418",
                        },
                        " ( >= 11)": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-deb11.tar.xz",
                            "dlHash": "9ca5625c89e8fcada02edced5048c3a3db0254e2bef1eb792d549d633222b108",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "af5ce42114cf7720c37fee3238781df4c75bb74914c62e6a68833fb434e0cad7",
                        },
                    },
                    "Linux_Fedora": {
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "1e59dc1e1a1b33085a1789b8ddafb55026211454efe0b4e814c956ef86fe3ea5",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "cfcdab399380dec7fedda55898bff975ac30b5d5d579433cbf8773b17c15f410",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "af5ce42114cf7720c37fee3238781df4c75bb74914c62e6a68833fb434e0cad7",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-ubuntu18_04.tar.xz",
                            "dlHash": "7b0bb22c263ae0b43459de1995bf465560d412c12d47af011b2ac27b5d30c7aa",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-ubuntu20_04.tar.xz",
                            "dlHash": "c2a8048caa3dbfe021d0212804f7f2faad4df1154f1ff52bd2f3c68c1d445fe1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-ubuntu18_04.tar.xz",
                            "dlHash": "7b0bb22c263ae0b43459de1995bf465560d412c12d47af011b2ac27b5d30c7aa",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-ubuntu18_04.tar.xz",
                            "dlHash": "7b0bb22c263ae0b43459de1995bf465560d412c12d47af011b2ac27b5d30c7aa",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-ubuntu20_04.tar.xz",
                            "dlHash": "c2a8048caa3dbfe021d0212804f7f2faad4df1154f1ff52bd2f3c68c1d445fe1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-linux-ubuntu18_04.tar.xz",
                            "dlHash": "7b0bb22c263ae0b43459de1995bf465560d412c12d47af011b2ac27b5d30c7aa",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-darwin.tar.xz",
                            "dlHash": "cd64f2a8f476d0f320945105303c982448ca1379ff54b8625b79fb982b551d90",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-windows.zip",
                            "dlHash": "b09e335b2ebeafa1db5e1e5614e3e10fb37da230a36865d76646ab27b2f3f46b",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "cabal-install-3.10.2.0-x86_64-freebsd",
                            "dlHash": "6dcd9d38a9f2101a0a3c3b74cacb2e41b8f7226f181780c0f872f2f1206dee37",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-i386-linux-alpine3_12.tar.xz",
                            "dlHash": "e219d2c6446c29e09644c4f064f4b87d486871ad6f6de16f0d2fcbd8626b5a5b",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-i386-linux-alpine3_12.tar.xz",
                            "dlHash": "e219d2c6446c29e09644c4f064f4b87d486871ad6f6de16f0d2fcbd8626b5a5b",
                        },
                    },
                    "Linux_Debian": {
                        "( >= 9 )": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-i386-linux-deb9.tar.xz",
                            "dlHash": "2b26d2cb67f1ba3561509fbccc30810ccc1c5032238fca00666e3dcd03e941a8",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-i386-linux-alpine3_12.tar.xz",
                            "dlHash": "e219d2c6446c29e09644c4f064f4b87d486871ad6f6de16f0d2fcbd8626b5a5b",
                        },
                    },
                },
                "A_ARM64": {
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-aarch64-darwin.tar.xz",
                            "dlHash": "d2bd336d7397cf4b76f3bb0d80dea24ca0fa047903e39c8305b136e855269d7b",
                        },
                    },
                    "Linux_Debian": {
                        "( >= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "004ed4a7ca890fadee23f58f9cb606c066236a43e16b34be2532b177b231b06d",
                        },
                        "( >= 11)": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-aarch64-linux-deb11.tar.xz",
                            "dlHash": "daa767a1b844fbc2bfa0cc14b7ba67f29543e72dd630f144c6db5a34c0d22eb1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "004ed4a7ca890fadee23f58f9cb606c066236a43e16b34be2532b177b231b06d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/cabal/cabal-install-3.10.2.0/cabal-install-3.10.2.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "004ed4a7ca890fadee23f58f9cb606c066236a43e16b34be2532b177b231b06d",
                        },
                    },
                },
            },
        },
        "3.10.2.1": {
            "viPostInstall": "cabal run is currently partially broken on Windows, please see https://github.com/haskell/cabal/issues/9334",
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.10.2.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-deb9.tar.xz",
                            "dlHash": "dae2be181d8cf980dadbc29d3e1b6101ae190449c280a2c2f72170625b216d08",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-deb10.tar.xz",
                            "dlHash": "e121eec7c04f827b59937c712efa6f7cc84bdb0c3a618c7ca381302320ff1303",
                        },
                        "( >= 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-deb11.tar.xz",
                            "dlHash": "e0b1a349749632f8aeeab6a92a779d86e99715dcabdbd15289b7ed72e08c2a57",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-deb9.tar.xz",
                            "dlHash": "dae2be181d8cf980dadbc29d3e1b6101ae190449c280a2c2f72170625b216d08",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-deb9.tar.xz",
                            "dlHash": "dae2be181d8cf980dadbc29d3e1b6101ae190449c280a2c2f72170625b216d08",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlHash": "2a31fc80be11aaf57e94b7e5f45cc010acccaa090309792921210c4bf1debaf1",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlHash": "b0d0726d8bbc4e8b586672562482c6be9c57127dfcc8b48bddc55ed32c8412cb",
                        },
                        "( >= 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "6ad7eb87f191c6891668d7ad81eabbaef53f9cbfdb017ae6e8736882523e0d8e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_Mint": {
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-mint20.tar.xz",
                            "dlHash": "9a309e1a532c67e560ce2392a753ee01e8314f87d8eb286f6f9bdfea61ffd8eb",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-mint21.tar.xz",
                            "dlHash": "e93ea8c55cf0315598f02b6129baf0c3c66537c2e7ecd3ee4f17378ea8b9aa7f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-fedora27.tar.xz",
                            "dlHash": "7cf6c7c5e704822360b2c85ce47db89e6cf122b020d57ed487313a9f8360b8c5",
                        },
                        "(>= 33 && < 37)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "7303ca87c745bfc6c2dca7b1438d254419eebea185a02840b7f9af6a70900e6c",
                        },
                        ">= 37": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "7a439775c63c6b994101d39ba1e9a8f326aeeffe15c5c8f87ab3f70493fa929a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-centos7.tar.xz",
                            "dlHash": "0d3735af6ddaa84d0822db296f5401bc5ba0189c0b171dedf23174cbde25a126",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "6a92fae58d3e62f7438a59e6ce128eb49278e6e6f07b744b63382778dba508e7",
                        },
                        "( >= 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "79eba1969b943e709d2dd1b745ea0557f500263fac149f8daf084ed6ed92834a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-alpine312.tar.xz",
                            "dlHash": "6b33b06ff19e11ce9648dfeed4359cbe92d0239bdabf956ea03078fc428e5d1c",
                        },
                        "( >= 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "b91f53717c6bc6af53cf1929f71779af26932eadc394a1e72d16d033757b35a6",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Linux_Void": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "ac565f37cd6c8952090a0f5b81a25cf2a3a0f15f89905b006e0f908f84506ad7",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-apple-darwin.tar.xz",
                            "dlHash": "38f4c0f989f10a173c3d2d32a852c70cd5c8ed24db4a0320a6841afda26f0382",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-mingw64.zip",
                            "dlHash": "cca5560db0f6f759f16eed222537f65b0cc55b854988cbb2e24902494c330654",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "414accf40d612307d050494fae961d2c2e77ae31e4eb303642233e296fda5170",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-i386-linux-unknown.tar.xz",
                            "dlHash": "7303dd5cf6a13e787fe275d3f26ec8f4eb1b70b8af8fe07072ca28074c7f66e8",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-i386-linux-unknown.tar.xz",
                            "dlHash": "7303dd5cf6a13e787fe275d3f26ec8f4eb1b70b8af8fe07072ca28074c7f66e8",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-aarch64-linux-deb10.tar.xz",
                            "dlHash": "a053887137bb2077b4959a3588fb20dc53c50b391f4d800f6c893ce3da6fe40a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-aarch64-apple-darwin.tar.xz",
                            "dlHash": "e6e050a37e78d94854db666d2670a65c2ff9b9e24cb62839f0a516582e7ff773",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.2.1/cabal-install-3.10.2.1-armv7-linux-deb10.tar.xz",
                            "dlHash": "33a8e115714c95c0724aa3bbabc34fecd2d02868bf8a1af374fcab5868f896af",
                        },
                    },
                },
            },
        },
        "3.10.3.0": {
            "viTags": [],
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.10.3.0.md",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-unknown.tar.xz",
                            "dlHash": "4b7af602c532c944e908a342b303fbaf76e68b9a50d6258f6aa08a5c8d8239e1",
                        },
                    },
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "83206d4f6ab433be0c2c2f29a498157b316bf56c395a6925324419db8cb54e56",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-deb10.tar.xz",
                            "dlHash": "39b44f8c36051bb1cd80c0bc87d611d49cc7c0090c9ec8f87ad14e84b2b5989d",
                        },
                        "( >= 11)": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-deb11.tar.xz",
                            "dlHash": "fa7e6e3a9aeb5e268faf90e1fc769936e730f2dc5217a5c79646b3bb3d5bfa3f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "83206d4f6ab433be0c2c2f29a498157b316bf56c395a6925324419db8cb54e56",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "83206d4f6ab433be0c2c2f29a498157b316bf56c395a6925324419db8cb54e56",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlHash": "6f9c28518b07ffe7d304fb4b0e90322341b2815f3f85645d929a8b4deb22ba13",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlHash": "2fdf84b382edf0b5bd2589fa6532572040caf1211d35295d20594a4bf79c478d",
                        },
                        "( >= 22 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "c947e2f15c427caba8f875fbe2274d85a9d0cdc5e2933ddd0acb3976461e0270",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlHash": "6f9c28518b07ffe7d304fb4b0e90322341b2815f3f85645d929a8b4deb22ba13",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-unknown.tar.xz",
                            "dlHash": "4b7af602c532c944e908a342b303fbaf76e68b9a50d6258f6aa08a5c8d8239e1",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-mint20.tar.xz",
                            "dlHash": "008036dbfecb3b05aa2ef7f1912bf890b34d1ef0e7851b097707656242d8d2ad",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-mint21.tar.xz",
                            "dlHash": "1759803e78967bc2667e18b87aafb41e49a209c8c9dde0b8dab742d45c1de508",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-mint20.tar.xz",
                            "dlHash": "008036dbfecb3b05aa2ef7f1912bf890b34d1ef0e7851b097707656242d8d2ad",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-fedora27.tar.xz",
                            "dlHash": "afc5032920a15d1493d48bb15664316a59e572263cb2bce1e287fb5c70f9fb7f",
                        },
                        "(>= 33 && < 37)": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "248311d2f2b14929a12a3e9188770affe5a5c81b34d5e38c103f158e480373db",
                        },
                        ">= 37": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "e817fe55a0111e321ceb9636fdbd68818700f1602c8b5d9bc1220efeb2b8704c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-fedora27.tar.xz",
                            "dlHash": "afc5032920a15d1493d48bb15664316a59e572263cb2bce1e287fb5c70f9fb7f",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "1d2cd62d072828e26f05be37b0f521d6e9ce522de987b07e44f854aafd362878",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "1d2cd62d072828e26f05be37b0f521d6e9ce522de987b07e44f854aafd362878",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "2a769d0d0bd9f89fd9a071c70854eed0a15437c6273d0819245f8c18ec1aa1fe",
                        },
                        "( >= 9 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "694e6e13af77fd498c3fd420041317d5ff5c81153ccb3e66f2e68afd774dae1b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "2a769d0d0bd9f89fd9a071c70854eed0a15437c6273d0819245f8c18ec1aa1fe",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "1d2cd62d072828e26f05be37b0f521d6e9ce522de987b07e44f854aafd362878",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-alpine312.tar.xz",
                            "dlHash": "54014e49563adde0e51799a2876586e1174468487ef23e9036d1137c1f0ccc1e",
                        },
                        "( >= 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "c22647bc6999aaedb633cacbee48a39d121d3e69b03f7c7d740b32bd10a07e0c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-unknown.tar.xz",
                            "dlHash": "4b7af602c532c944e908a342b303fbaf76e68b9a50d6258f6aa08a5c8d8239e1",
                        },
                    },
                    "Linux_Void": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-linux-unknown.tar.xz",
                            "dlHash": "4b7af602c532c944e908a342b303fbaf76e68b9a50d6258f6aa08a5c8d8239e1",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-apple-darwin.tar.xz",
                            "dlHash": "d7eab32afe5484f217fb28eaa3f5fd79988cea14840d15892dffebb6edb68cbc",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-mingw64.zip",
                            "dlHash": "ee2c6c46f8681b028efa0b9ef8799e2693b2f38b5517e447a6487d9234831820",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "7fd44ea2daad33d85330c9b66589433a59e3a20d18d1c36875cef74da2921ddf",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-i386-linux-unknown.tar.xz",
                            "dlHash": "789d1f5e0b63a098fea8585ed9c9d7e10b50831b0b0c0f80ba7a1fe51dbebded",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-i386-linux-unknown.tar.xz",
                            "dlHash": "789d1f5e0b63a098fea8585ed9c9d7e10b50831b0b0c0f80ba7a1fe51dbebded",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-aarch64-alpine3_20.tar.xz",
                            "dlHash": "209ed05e04ce01b261a1eba12eb9e0c789246347427d352d8dffa63a2f96eb73",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "8ab41fad5fd75b3fd117f282cfeb03c02eeced9a70a7ecce8c8134a39dafae3a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-aarch64-apple-darwin.tar.xz",
                            "dlHash": "daa1704835834a3f0acab876d672b0e3a1c34223593f99eb663377cba4a92b70",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-armv7-linux-deb10.tar.xz",
                            "dlHash": "8131b0984e6f7a7776f66fcd1f4357a8af00741aa085e194217ae10ab8609130",
                        },
                    },
                },
            },
        },
        "3.12.1.0": {
            "viTags": [
                "Recommended",
            ],
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.12.1.0.md",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "9bab17c5ac7a77bbd06d29eefd2e656569ed03848092b106b49e5f038b9429b2",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-deb10.tar.xz",
                            "dlHash": "84d2bf2d4615bf211d9a14b144ebf9f5be7867c05da0ed737733262b723df411",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-deb11.tar.xz",
                            "dlHash": "9f6e307e336d8117ca962027b456a5026dd022d31da348886928d006d0c2ff19",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-deb12.tar.xz",
                            "dlHash": "f8371100bd35aa1bc471f3d952adfec8a3e7d33117f1f889271f9c4336389688",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-deb12.tar.xz",
                            "dlHash": "f8371100bd35aa1bc471f3d952adfec8a3e7d33117f1f889271f9c4336389688",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 18": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-deb9.tar.xz",
                            "dlHash": "9bab17c5ac7a77bbd06d29eefd2e656569ed03848092b106b49e5f038b9429b2",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlHash": "9ad2b514bc61e60eae9bd8ca026cb27dd3d955a4ecb53291424241f598041ed1",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlHash": "7303fdbf64bf7d23987accc29520f7ac8a4a9cd4b15d5433328f5a4de1dec8b4",
                        },
                        "( >= 22 && < 24 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "d69523109f19a22d61713e70b784ab84afdcff58302278b39206d5c7cb92d091",
                        },
                        "( >= 24 && < 25 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlHash": "ab785f6449f0fa33c19fe0e8631dba9588f8998b3122f24b5aede99372ffa5b7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlHash": "ab785f6449f0fa33c19fe0e8631dba9588f8998b3122f24b5aede99372ffa5b7",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-mint19.tar.xz",
                            "dlHash": "89ff0f804acc81e3ba969b3b23683795fa970fa201cec138710aa5005e944cb7",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-mint20.tar.xz",
                            "dlHash": "a98b718456f5edef16a37656e39073a226d8411955a1649f3b9e951136b98bca",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-mint21.tar.xz",
                            "dlHash": "6b0998e9e4ed75884255793787d3a2b51af112cb46e3808a4b949324d7aa7c43",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-mint21.tar.xz",
                            "dlHash": "6b0998e9e4ed75884255793787d3a2b51af112cb46e3808a4b949324d7aa7c43",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-fedora27.tar.xz",
                            "dlHash": "ab19ac12a7dc9c9b19a55cbe07ca5ae03a728f6ec2d7127b331a88bf4bdcdedb",
                        },
                        "(>= 33 && < 37)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "d1ade18b52aa612acc5f7cc57c8795880894105d0ddf1087afcef359833f3a2d",
                        },
                        ">= 37": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "6dd58f2d631f08e8004f8100b86ebf982bde11be62572d6843af58999c000a85",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "6dd58f2d631f08e8004f8100b86ebf982bde11be62572d6843af58999c000a85",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "a85d9de8aff5f3c54d9641406349daa75077f2d453abb7aa5141fe894fb7c295",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "a85d9de8aff5f3c54d9641406349daa75077f2d453abb7aa5141fe894fb7c295",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "a78d6bc680f95bc3cd8817310df8a8423d769be983eeace8bd7d2f16bdf7bfb4",
                        },
                        "( >= 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "a585459eed9a1118c1a210f0e70fee0b76c8b2f277727e3f79d94d6176e628a8",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "a585459eed9a1118c1a210f0e70fee0b76c8b2f277727e3f79d94d6176e628a8",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "a78d6bc680f95bc3cd8817310df8a8423d769be983eeace8bd7d2f16bdf7bfb4",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "a85d9de8aff5f3c54d9641406349daa75077f2d453abb7aa5141fe894fb7c295",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-alpine312.tar.xz",
                            "dlHash": "c0adc03df1b30e4bb8386d8d77c15a434b07a5f4f232cb8b83b76f328c2858c9",
                        },
                        "( >= 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "835786db07f827c9c97d9325c805d2acc2d78fcf0e9f1bf5e0af51f26a3903b3",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "835786db07f827c9c97d9325c805d2acc2d78fcf0e9f1bf5e0af51f26a3903b3",
                        },
                    },
                    "Linux_Void": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-centos7.tar.xz",
                            "dlHash": "a85d9de8aff5f3c54d9641406349daa75077f2d453abb7aa5141fe894fb7c295",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-apple-darwin.tar.xz",
                            "dlHash": "2027e2bfec083fb736d196fb425701a90a0267a1074979ccff2c512fd697800c",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-mingw64.zip",
                            "dlHash": "2c384a9d10451c77e3387ebe6bad03d3d9056d89846ff296597037400775e61b",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "c27661ef3ef93e6364a2e94c55a625d74c1973a2b26c1911d00393e51fe36c26",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-i386-linux-unknown.tar.xz",
                            "dlHash": "7991f4e33eaae6a1c1da283ab0b39f67baecd4b8d9300d467db5e7a325f14b12",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-i386-linux-unknown.tar.xz",
                            "dlHash": "7991f4e33eaae6a1c1da283ab0b39f67baecd4b8d9300d467db5e7a325f14b12",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-aarch64-alpine3_20.tar.xz",
                            "dlHash": "9d1556fa93dab06749810455b9ac4655499cdb62b5bdff55e0d07c91506f9721",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "775831c10bdd389a9f4c3cc46601b66f13ff4460a65a2eddd39c09abfe7aa2e5",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-aarch64-apple-darwin.tar.xz",
                            "dlHash": "a98751cb507d8ac81bf30cd302291066ddae4a556bfc0dbfed9b1a15cffe929b",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.12.1.0/cabal-install-3.12.1.0-armv7-linux-deb10.tar.xz",
                            "dlHash": "40faab60fd03bb75c1651fb9255f715336087d5ad79f9e502df824ca339b45db",
                        },
                    },
                },
            },
        },
        "3.14.1.0": {
            "viTags": [],
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.14.1.0.md",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-deb10.tar.xz",
                            "dlHash": "09e32675de51c45bb3c9d2b10755ce32f7e9512beaf491fe1428f420b12c3fd4",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-deb11.tar.xz",
                            "dlHash": "94f7943b587420e1d1b2846b40613b4fc0bf8cc3f958d4a758a3357b0982243c",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-deb12.tar.xz",
                            "dlHash": "aee9a1474d796e35bcbb53f05e4fd887a1decbe0de3bdb532d989034ddc61ae8",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-deb12.tar.xz",
                            "dlHash": "aee9a1474d796e35bcbb53f05e4fd887a1decbe0de3bdb532d989034ddc61ae8",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlHash": "a0cedf917def4fb4a3b3a21dca33306373824bad03b104821f4c56100e9074b8",
                        },
                        "( >= 22 && < 24 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "e711913f119c33cd9e88c3e007e076f5df2bfc1eaf0fdac996b3ac8adbbcf69d",
                        },
                        "( >= 24 && < 25 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlHash": "50430c2529a1653b661083ebf5869252907893e2ae0ead98f32bf07d3166285a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlHash": "50430c2529a1653b661083ebf5869252907893e2ae0ead98f32bf07d3166285a",
                        },
                    },
                    "Linux_Mint": {
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-mint20.tar.xz",
                            "dlHash": "1ae8d1a151150aebffac01dc3ce6c66c5e602f3deed50d1a7e996c079a33c036",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-mint21.tar.xz",
                            "dlHash": "e711913f119c33cd9e88c3e007e076f5df2bfc1eaf0fdac996b3ac8adbbcf69d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-mint21.tar.xz",
                            "dlHash": "e711913f119c33cd9e88c3e007e076f5df2bfc1eaf0fdac996b3ac8adbbcf69d",
                        },
                    },
                    "Linux_Fedora": {
                        "(>= 33 && < 37)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "c26bdb33c195ad7c21044764e009cfe3e488bd3b18437b489e37945e396e5ba0",
                        },
                        ">= 37": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "5f210f10a4bb9c59c4cf8c3b503b666f16ee6f23004ff673193a89637c10b144",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "5f210f10a4bb9c59c4cf8c3b503b666f16ee6f23004ff673193a89637c10b144",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "0625aff317bc01136aea09d549587d128bbfbcd51a144b8a8333ca6c8176e53f",
                        },
                        "( >= 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "1c4d3934ad92e7b7f4155f4c98dcc6494d47d5d9121967ffb3a47572693b7e7f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "1c4d3934ad92e7b7f4155f4c98dcc6494d47d5d9121967ffb3a47572693b7e7f",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "0625aff317bc01136aea09d549587d128bbfbcd51a144b8a8333ca6c8176e53f",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-unknown.tar.xz",
                            "dlHash": "86d0da626555f739717775aeb86c0faaa4e392d0c5bf9be03e8a230b59b6c547",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-alpine312.tar.xz",
                            "dlHash": "f0c6d11f2bcb398bf2f6720091dd05a0f5487d6c045f58f841053f8960e28018",
                        },
                        "( >= 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "ecbca93cf1227676e046e5efa3cd6838730f19f19ec10a0c1764cbe4c10180ac",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "ecbca93cf1227676e046e5efa3cd6838730f19f19ec10a0c1764cbe4c10180ac",
                        },
                    },
                    "Linux_Void": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-linux-unknown.tar.xz",
                            "dlHash": "86d0da626555f739717775aeb86c0faaa4e392d0c5bf9be03e8a230b59b6c547",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-apple-darwin.tar.xz",
                            "dlHash": "20f7a1e2c17407102c7278cad49598c826871496b37b856c4217d89cb81ad82d",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-mingw64.zip",
                            "dlHash": "143f8f8f6d4aba2cefe4b27741094bfcb4c50da9f6dbe38f3cbd96e53404decf",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "9c80bbf6741ca499352533f113da09215fb8c133432dc1225008ced428e2e208",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-i386-linux-unknown.tar.xz",
                            "dlHash": "e368ac4f1b16820dc9d1ff644ac643337e9c7876930e3ab22b1f680133571bd0",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-i386-linux-unknown.tar.xz",
                            "dlHash": "e368ac4f1b16820dc9d1ff644ac643337e9c7876930e3ab22b1f680133571bd0",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-aarch64-linux-deb10.tar.xz",
                            "dlHash": "8c1ecc266493d1b5dd2a75bc9f1e7c582e4a80d3c98481c2ffe1696ae5f7526b",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-aarch64-linux-alpine.tar.xz",
                            "dlHash": "80b9e158e959a7a28ccaacab598234c9c439e6111a6179cfa42bff2e07800a71",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-aarch64-apple-darwin.tar.xz",
                            "dlHash": "efb2a5108e57462939a791ed9e19b208d25e2a61dd6c5ea119ee2ae026c6bf64",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.0/cabal-install-3.14.1.0-armv7-linux-deb10.tar.xz",
                            "dlHash": "bd9fe6d2ebc1a4755fb4a609530aa8dd4460d00181c195b9640a86dff9beea0f",
                        },
                    },
                },
            },
        },
        "3.14.1.1": {
            "viTags": [
                "Latest",
            ],
            "viChangeLog": "https://github.com/haskell/cabal/blob/master/release-notes/cabal-install-3.14.1.1.md",
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-deb10.tar.xz",
                            "dlHash": "44fb743eb3a7e183bf5f0c9dc8823f5621cb579cb70873fd873d8ff822d9d20e",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-deb11.tar.xz",
                            "dlHash": "28f27ae78e9de5a8c96e5dedc2e230da6320d648a38b76187dcd3b5acfc181d6",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-deb12.tar.xz",
                            "dlHash": "43d3d11bccec8909a977b53e8b3933e0fcdddabee0ad4b0dbd73f65a3e9d9b38",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-deb12.tar.xz",
                            "dlHash": "43d3d11bccec8909a977b53e8b3933e0fcdddabee0ad4b0dbd73f65a3e9d9b38",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlHash": "783d87786e5a31f89ed93329ca3d9650bde37873100afc3a057ff2420d5522ea",
                        },
                        "( >= 22 && < 24 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlHash": "177219c1baf8fe4a38a34c3b9836f8bab872d1e4d8664f280c67499268558466",
                        },
                        "( >= 24 && < 25 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlHash": "4fe58e7a1dbcacaac3f33bfa12d8a1f2f8c6b42d755bbdcc0c54cc33512cf560",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlHash": "4fe58e7a1dbcacaac3f33bfa12d8a1f2f8c6b42d755bbdcc0c54cc33512cf560",
                        },
                    },
                    "Linux_Mint": {
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-mint20.tar.xz",
                            "dlHash": "386f46cca904c9dc410c12350875459a45b61e1efb9767ecdb7abcba255eed92",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-mint21.tar.xz",
                            "dlHash": "314983982fdc61e3e19a34017910b941edd09608f27c8f97e6fe87a2522bddc2",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-mint21.tar.xz",
                            "dlHash": "314983982fdc61e3e19a34017910b941edd09608f27c8f97e6fe87a2522bddc2",
                        },
                    },
                    "Linux_Fedora": {
                        "(>= 33 && < 37)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-fedora33.tar.xz",
                            "dlHash": "8e3d280dce9a26cd36013a20a523c9aeeec8062f8f9618980da0e127ca95af8a",
                        },
                        ">= 37": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "2ec2015928cce8f525c9a7f55b5d088f9b20ca385c688f853eba5b9b4446e84c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-fedora37.tar.xz",
                            "dlHash": "2ec2015928cce8f525c9a7f55b5d088f9b20ca385c688f853eba5b9b4446e84c",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "367410f71b1d9bed0bc38258e7e74906705d67aba0e8d65313006a8e40d733fb",
                        },
                        "( >= 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "2091b7535ad367cb9f517801a1aaeefc54f3f38b6965d5a15542fcfa9a7f5745",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-rocky9.tar.xz",
                            "dlHash": "2091b7535ad367cb9f517801a1aaeefc54f3f38b6965d5a15542fcfa9a7f5745",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-rocky8.tar.xz",
                            "dlHash": "367410f71b1d9bed0bc38258e7e74906705d67aba0e8d65313006a8e40d733fb",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "867216e098e3bb2d0536573f010c121dcfe6308a7dfb4097521ae893f4f618c1",
                        },
                    },
                    "Linux_Alpine": {
                        "( >= 3.12 && < 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-alpine312.tar.xz",
                            "dlHash": "441571f0ca5fa172875e4e9b8279c9e9601463b42dd5a825d5edaa69590074e0",
                        },
                        "( >= 3.19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "50ae94256d1b008e1e171cf1c440a03a59493e90f7bd2aa2073962cb57495983",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-alpine319.tar.xz",
                            "dlHash": "50ae94256d1b008e1e171cf1c440a03a59493e90f7bd2aa2073962cb57495983",
                        },
                    },
                    "Linux_Void": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-linux-unknown.tar.xz",
                            "dlHash": "867216e098e3bb2d0536573f010c121dcfe6308a7dfb4097521ae893f4f618c1",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-apple-darwin.tar.xz",
                            "dlHash": "e7e0c38bd8d83c65b4d21891e81d8c5de1c2b4dc80c2738e3d14e77cba4301ae",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-mingw64.zip",
                            "dlHash": "80376ac2aca0da77649942333b8c2c11f734acd722aecdf49ea8512fa0d5e127",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-x86_64-portbld-freebsd.tar.xz",
                            "dlHash": "61892a23144a0688dd5e3ffe78927c02f274108b1136d7fb40ed8522c5c7ebfd",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-i386-linux-unknown.tar.xz",
                            "dlHash": "d8fd781e00e3335177dccf3842bf7b1a6f6ef4a1743dd5a6e06d97d5390b71bb",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-i386-linux-unknown.tar.xz",
                            "dlHash": "d8fd781e00e3335177dccf3842bf7b1a6f6ef4a1743dd5a6e06d97d5390b71bb",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-aarch64-linux-deb10.tar.xz",
                            "dlHash": "089c6d4ba65f38c7eb3411917f4700c1ae1d2efd463b140263ed477e783ff4f8",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-aarch64-linux-alpine.tar.xz",
                            "dlHash": "90d2e377c2d02148ed1b964eeb505c45abe5d5722088b71a1dc6349e5d025f6e",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-aarch64-apple-darwin.tar.xz",
                            "dlHash": "bf2a6b8c89fdc88132e9115393798250810713abb65961af04b7cc086c13f259",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.1.1/cabal-install-3.14.1.1-armv7-linux-deb10.tar.xz",
                            "dlHash": "1e65116ad0e66396155efbacd4dd5948d7339cd5d84b280c628bae3e025368b2",
                        },
                    },
                },
            },
        },
    },
    "GHCup": {
        "0.1.40.0": {
            "viTags": [
                "Recommended",
                "Latest",
            ],
            "viChangeLog": "https://github.com/haskell/ghcup-hs/blob/master/CHANGELOG.md",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/ghcup-0.1.40.0-src.tar.gz",
                "dlSubdir": "ghcup-0.1.40.0",
                "dlHash": "c5bca7dcf4cced0a8b430ebf36fd70ffc0d1a732c0a1f0a014b2129e8dacb7a4",
            },
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/x86_64-linux-ghcup-0.1.40.0",
                            "dlHash": "70ca52b73ee796f5c43b4259f7fcedc2a0d60d85a6a9ed40a82ea8553fca34a0",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/x86_64-apple-darwin-ghcup-0.1.40.0",
                            "dlHash": "3d1f568bb3d73a2013486bf07722afb8f5b998eb3985385b8e59b55ccf14ed09",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/x86_64-portbld-freebsd-ghcup-0.1.40.0",
                            "dlHash": "6890b7d54e2ef3c7fc940ce7da980babcf03e2e30562afe52522aa656e2e1bac",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/x86_64-mingw64-ghcup-0.1.40.0.exe",
                            "dlHash": "65af3e0cfa6e47e7b4ead50d5f64849c6907ccc5d148c63d7c06a9a051ec8112",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/x86_64-linux-ghcup-0.1.40.0",
                            "dlHash": "70ca52b73ee796f5c43b4259f7fcedc2a0d60d85a6a9ed40a82ea8553fca34a0",
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/i386-linux-ghcup-0.1.40.0",
                            "dlHash": "01bb5feeb15631d84163e67966b4d66461ef46a9ed36ff828b89adb558761241",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/i386-linux-ghcup-0.1.40.0",
                            "dlHash": "01bb5feeb15631d84163e67966b4d66461ef46a9ed36ff828b89adb558761241",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/aarch64-linux-ghcup-0.1.40.0",
                            "dlHash": "86df64134ab8ca6d4e8b0980e94fc36a447ff09ea823885034a3dd5617e840f3",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/aarch64-linux-ghcup-0.1.40.0",
                            "dlHash": "86df64134ab8ca6d4e8b0980e94fc36a447ff09ea823885034a3dd5617e840f3",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/aarch64-apple-darwin-ghcup-0.1.40.0",
                            "dlHash": "235b162800a3348091267964a4357c43f0694344b5b60c73dc1f6ea8ab2db208",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/0.1.40.0/armv7-linux-ghcup-0.1.40.0",
                            "dlHash": "262cf5717700f40b7b43d7a65e50b17aec7292bd7e104dba1461e29f6252e7fc",
                        },
                    },
                },
            },
        },
    },
    "HLS": {
        "1.1.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#110",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.1.0/haskell-language-server-Linux-1.1.0.tar.gz",
                            "dlHash": "0f0dadb0e9a08273658f565fd71c636801959b954be2737f38f2a1aac522208f",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.1.0/haskell-language-server-macOS-1.1.0.tar.gz",
                            "dlHash": "4e89b192e2f49637d772e974f2c17b16da067ecd5912575eaa542551de97681b",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/hls/1.1.0/haskell-language-server-Windows-1.1.0.tar.gz",
                            "dlHash": "a1d3f451e64a041aa527a25da29e4716a2de6ae347cef4ef9312fc7611e168cc",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.1.0/haskell-language-server-Linux-1.1.0.tar.gz",
                            "dlHash": "0f0dadb0e9a08273658f565fd71c636801959b954be2737f38f2a1aac522208f",
                        },
                    },
                },
            },
        },
        "1.2.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#120",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.2.0/haskell-language-server-Linux-1.2.0.tar.gz",
                            "dlHash": "d29ee22f7bd706da2e2a1bd7640e25bb9736adeafb34eef47d29ea143b0fa927",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.2.0/haskell-language-server-macOS-1.2.0.tar.gz",
                            "dlHash": "a310d8a3e9c5c4218210f750682c74a0f82ad0f59995adde0dbe775115b1e357",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.2.0/haskell-language-server-Windows-1.2.0.tar.gz",
                            "dlHash": "961c6ff12c9a9c7a4609f239c5ac70d7d16753cdb8c10348a6a51feeaa0b6aea",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.2.0/haskell-language-server-Linux-1.2.0.tar.gz",
                            "dlHash": "d29ee22f7bd706da2e2a1bd7640e25bb9736adeafb34eef47d29ea143b0fa927",
                        },
                    },
                },
            },
        },
        "1.3.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#130",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.3.0/haskell-language-server-Linux-1.3.0.tar.gz",
                            "dlHash": "0f232cd4316f5215eb82c6d8f568260e1862a9b39a68ec37662e5e87b714f271",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.3.0/haskell-language-server-macOS-1.3.0.tar.gz",
                            "dlHash": "2ce9763718544c2e1ff6b005d9bdc86178dcdaf71e63dc68d3fcd23457abf180",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.3.0/haskell-language-server-Windows-1.3.0.tar.gz",
                            "dlHash": "46aac7be888e29a9907cf56698c1ce1475c148b5e6cc099513e9ef74a0520dcf",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.3.0/haskell-language-server-Linux-1.3.0.tar.gz",
                            "dlHash": "0f232cd4316f5215eb82c6d8f568260e1862a9b39a68ec37662e5e87b714f271",
                        },
                    },
                },
            },
        },
        "1.4.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#140",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/ghcup/src/haskell-language-server/1.4.0/haskell-language-server-1.4.0.tar.gz",
                "dlSubdir": "haskell-language-server-1.4.0",
                "dlHash": "c5d7dbf7fae9aa3ed2c1184b49e82d8ac623ca786494ef6602cfe11735d28db0",
            },
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.4.0/haskell-language-server-Linux-1.4.0.tar.gz",
                            "dlHash": "f93c114441911ccce55649702adc9553cb4c9f953c37878321d2806a3525fee8",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.4.0/haskell-language-server-macOS-1.4.0.tar.gz",
                            "dlHash": "a7f0ac6be93ffb08cc239e5f5fead99b061061825f99566c1be33ee60cab62a4",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.4.0/haskell-language-server-freebsd-1.4.0.tar.gz",
                            "dlHash": "6b2ad2398ed8c3964dea017e3d5e553b54c10ba1373d7653d2edd019854f4da2",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.4.0/haskell-language-server-Windows-1.4.0.tar.gz",
                            "dlHash": "0ec77cee750037b7a0ede817b46a913a702821f4098c6a858bcb686cb30f7efd",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.4.0/haskell-language-server-Linux-1.4.0.tar.gz",
                            "dlHash": "f93c114441911ccce55649702adc9553cb4c9f953c37878321d2806a3525fee8",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.4.0/haskell-language-server-linux-aarch64-1.4.0.tar.gz",
                            "dlHash": "8ad97e2bf1c538e637edec194e1cd9939019955bb749cb470f34bbe5a067b001",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.4.0/haskell-language-server-macOS-aarch64-1.4.0.tar.gz",
                            "dlHash": "70c6fe38e987ba44c1e19173486c01f666ffb30a74cd5a7968296a5aba4c2dd0",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.4.0/haskell-language-server-linux-armv7-1.4.0.tar.gz",
                            "dlHash": "4a921fbca06b02f3b1c0930cec5e65e9362b603e7715680ec7b150f18bd703d6",
                        },
                    },
                },
            },
        },
        "1.5.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#150",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.0/haskell-language-server-1.5.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.5.0",
                "dlHash": "fb801c0693cb98446667b94bd858dcaaca2c1e18ec12bf260c4c928023bdfd06",
            },
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.0/haskell-language-server-Linux-1.5.0.tar.gz",
                            "dlHash": "9fcd5f97de4efa92534b199965aa4aff7907fdc0eff4e2ae5af4c8b33cca2acc",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.0/haskell-language-server-macOS-1.5.0.tar.gz",
                            "dlHash": "4557c0692f3ea0fc67e171b80c15dc9556d94853ab7d2f1a5ad882d0c50ce31c",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.5.0/haskell-language-server-FreeBSD-1.5.0.tar.xz",
                            "dlHash": "a399cb7b2ab76d1d4e481f2dd234da30f78c3f4790bac6a44635f636ce3b4d72",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.0/haskell-language-server-Windows-1.5.0.tar.gz",
                            "dlHash": "60c4a876181b4372a9b883b9257680517462f0400d9ac0b5aca38cbedb6fec8a",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.0/haskell-language-server-Linux-1.5.0.tar.gz",
                            "dlHash": "9fcd5f97de4efa92534b199965aa4aff7907fdc0eff4e2ae5af4c8b33cca2acc",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.5.0/haskell-language-server-linux-aarch64-1.5.0.tar.xz",
                            "dlHash": "7310a233094e0d4303f72afbb49b724c68a25a20fcb16354f862dd95ca63ad0a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.5.0/haskell-language-server-macOS-aarch64-1.5.0.tar.xz",
                            "dlHash": "ebabc495c7741bb8969470ac94a6a58e4e88be2feb2ca7e28060ba7dce044b38",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/haskell-language-server/1.5.0/haskell-language-server-linux-armv7-1.5.0.tar.xz",
                            "dlHash": "7115c5861d8d30206ba2600d1a294539f3a15c09a1cb88ce48ac75dc5034e38a",
                        },
                    },
                },
            },
        },
        "1.5.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#151",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-1.5.1-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.5.1",
                "dlHash": "fa2b1d39d413283202ee1f75e4ad9fc44544535741370d6f1e63afd5878d9e40",
            },
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-Linux-1.5.1.tar.gz",
                            "dlHash": "8c6406f46181f31e2314ec008bd290bfcdfe2c6126851934b3b11d7d0266c554",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-macOS-1.5.1.tar.gz",
                            "dlHash": "9efcff9ed2b8f07176899dfdb1b2ad6161f994e56102cf020cbe9602ad0a0e34",
                        },
                    },
                    "FreeBSD": {
                        "( >= 12 && < 13 )": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-FreeBSD-1.5.1.tar.xz",
                            "dlHash": "79d0ca919800f361dca9d69ce822b6ac178f60c6594925e24e8931f9328e68c6",
                        },
                        "( >= 13 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/1.5.1/haskell-language-server-1.5.1.0-x86_64-freebsd13.tar.xz",
                            "dlHash": "86152ac4c5400fc17b7459f4f94d2b41395ac6860511db7ca9ba1c41510636b2",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-Windows-1.5.1.tar.gz",
                            "dlHash": "353756304f8a912e329a6d18e588560d3ee8d34fe5ca14a0c7adee787d350bb0",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-Linux-1.5.1.tar.gz",
                            "dlHash": "8c6406f46181f31e2314ec008bd290bfcdfe2c6126851934b3b11d7d0266c554",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-Linux-aarch64-1.5.1.tar.xz",
                            "dlHash": "1f4252132f1eec5d84f5e5b7a296e90f2c8ab401f07f3a3de645110ba0190894",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-macOS-aarch64-1.5.1.tar.xz",
                            "dlHash": "af8f5038678f8e16466a885e9d56dc9ae750d1e19426c16716410d032515c7fc",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.5.1/haskell-language-server-Linux-armv7-1.5.1.tar.xz",
                            "dlHash": "d28beb003581d5a2133099fd59c83a49af850e7b5cbca72fb3df088d218e0f2b",
                        },
                    },
                },
            },
        },
        "1.6.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#1600",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-1.6.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.6.0.0",
                "dlHash": "08703a234327b977cf6cff32d20fa3a4e3a2f8ea15d11c10fa51e69bb82bae41",
            },
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-Linux-1.6.0.0.tar.gz",
                            "dlHash": "dba25f63264e05ee0b7e45526f0ffbfb9b16bea72c25c1f23fbea2be921a7e62",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-macOS-1.6.0.0.tar.gz",
                            "dlHash": "e5cbca6cdd73977ef18d6c254bc741a4c285845e23459ae0e5a9033e72d66696",
                        },
                    },
                    "FreeBSD": {
                        "( >= 12 && < 13 )": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-FreeBSD12-x86_64-1.6.0.0.tar.xz",
                            "dlHash": "736c5d286d0a2d488baa2ef68961cdad8846410acb423115c2f42a0a0cf46dcd",
                        },
                        "( >= 13 )": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-FreeBSD13-x86_64-1.6.0.0.tar.xz",
                            "dlHash": "0fcb58a457ee91cd89011a3a49d6cedea9f2a002fcdd4b0bbd4fe1d550b9bdf7",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-Windows-1.6.0.0.tar.gz",
                            "dlHash": "9f1b4ea31602a775a8f5bfedcc6290d3e45dd695f389fd705c9fff96c63c8570",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-Linux-1.6.0.0.tar.gz",
                            "dlHash": "dba25f63264e05ee0b7e45526f0ffbfb9b16bea72c25c1f23fbea2be921a7e62",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-Linux-aarch64-1.6.0.0.tar.xz",
                            "dlHash": "6ff33c8029d47248bdbcb0f01e81532d5f5afc012b538eabd9074f5cad2e9ac9",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-macOS-aarch64-1.6.0.0.tar.xz",
                            "dlHash": "c6046353b0a6807d840ba2b98484fcfc76d0894f3cabcb3c1802c84f476f8383",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.0.0/haskell-language-server-Linux-armv7-1.6.0.0.tar.xz",
                            "dlHash": "b4b73cfdd3fce33ecf5e9e75b40d7b01f0889eceef1b39e57f958579b194e2bf",
                        },
                    },
                },
            },
        },
        "1.6.1.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#1610",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-1.6.1.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.6.1.0",
                "dlHash": "e5c336ad2de8d021c882cdac5bbc26bf6427df8d2a5bd244c05cf18296a9bfdc",
            },
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-Linux-1.6.1.0.tar.gz",
                            "dlHash": "03f13214216c39c09ed9d073317cbf7bdc98a75d0c4ee2fd526e446457591d25",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-macOS-1.6.1.0.tar.gz",
                            "dlHash": "287adf17a4d5704316a5dd441719a6f6ad657ab6ac660a17bfca0c07c283a6b8",
                        },
                    },
                    "FreeBSD": {
                        "( >= 12 && < 13 )": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-FreeBSD12-x86_64-1.6.1.0.tar.xz",
                            "dlHash": "3d765164b9f9ae5c9ce3b9ed1d04559767c189c5b4a02b0691731fd05fe5e6d0",
                        },
                        "( >= 13 )": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-FreeBSD13-x86_64-1.6.1.0.tar.xz",
                            "dlHash": "be8a8f7b5775fada0c2313ec14e9763908ecc1d82b48522e76c356750fe752fb",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-Windows-1.6.1.0.tar.gz",
                            "dlHash": "b5efc77facde2136a1c5fbc1fbe1affa270efd913f9f1a200fb82b5f5b111756",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-Linux-alpine-x86_64-1.6.1.0.tar.xz",
                            "dlHash": "9dcf35793b8ede815db9ecf13d94fa89dfb498dcda4281bbbb94ae4efe332cf5",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-Linux-aarch64-1.6.1.0.tar.xz",
                            "dlHash": "19318d240d2fa8ec3e22ae7c4746445b25e132cbb2eca2adc5e87f7544b5a7e4",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-macOS-aarch64-1.6.1.0.tar.xz",
                            "dlHash": "feca2336d7b98d23ceff10438d26476c71ce6ce45e617195927556a24e1480bf",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/haskell/haskell-language-server/releases/download/1.6.1.0/haskell-language-server-Linux-armv7-1.6.1.0.tar.xz",
                            "dlHash": "ea174e82678c25a017ff564c5329a80dc18030139b9bfcad2da8fe888617446b",
                        },
                    },
                },
            },
        },
        "1.7.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#1700",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.7.0.0",
                "dlHash": "2974994866383fb0ffa892047dfe67d9dbaa268e647689d58b92f3593d6d7b7f",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "ad3f99776f9ad37509b1961bb36fc2f19a851abb6c34847edd56bc554dc7ea56",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "ad8050776698dd6539a70f274c426fcb6e52c1be8414821c612748fa149182d7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "ad3f99776f9ad37509b1961bb36fc2f19a851abb6c34847edd56bc554dc7ea56",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "cad0a9800004e7dc78eae824118f92efc33b9ed30f20f1e9584b57695ff93e50",
                        },
                        "( >= 16 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "ad3f99776f9ad37509b1961bb36fc2f19a851abb6c34847edd56bc554dc7ea56",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "ad3f99776f9ad37509b1961bb36fc2f19a851abb6c34847edd56bc554dc7ea56",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "cad0a9800004e7dc78eae824118f92efc33b9ed30f20f1e9584b57695ff93e50",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 28 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "cad0a9800004e7dc78eae824118f92efc33b9ed30f20f1e9584b57695ff93e50",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "cad0a9800004e7dc78eae824118f92efc33b9ed30f20f1e9584b57695ff93e50",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "7c74931af640c6e6d7c20a2aa0ea6cc31025dbc6026a07daba3d35ca59be6f02",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "7c74931af640c6e6d7c20a2aa0ea6cc31025dbc6026a07daba3d35ca59be6f02",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "7c74931af640c6e6d7c20a2aa0ea6cc31025dbc6026a07daba3d35ca59be6f02",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "cad0a9800004e7dc78eae824118f92efc33b9ed30f20f1e9584b57695ff93e50",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-x86_64-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "3183ac97b80823256585bf740a79a7fdd9dca08e5b71eaf7497085eec0c8a572",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/hls/1.7.0.0/haskell-language-server-1.7.0.0-x86_64-unknown-mingw32.zip",
                            "dlHash": "109168ee61a8e0613d8f223583e149aff0812053c3adbacd0a23b468dc7f0518",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "486a71744e4c79428ea5b19186d3beb0fb9d36d6f38909f9da7d92c09ed00b1f",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.7.0.0/haskell-language-server-1.7.0.0-aarch64-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.7.0.0",
                            "dlHash": "d82030533f69b862cc6149d7a9b32dfa81fc6a803cb089c59f00ef94efcce3bb",
                        },
                    },
                },
            },
        },
        "1.8.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md#1800",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.8.0.0",
                "dlHash": "e1081ac581d21547d835beb8561e815573944aa0babe752a971479da3a207235",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "a888f093a7cd3b2dc11f1cdc3567c63395c7f3b2c17fab85f7591d3b40183851",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "63ee164e83ac76d440e0c0e777e9c7604dddff498fa53368132326d03da1817f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "a888f093a7cd3b2dc11f1cdc3567c63395c7f3b2c17fab85f7591d3b40183851",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "f431add1ca5881d04caef9d2cf834248d8b4c36c7884221e39152c1aecd1ce56",
                        },
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "a888f093a7cd3b2dc11f1cdc3567c63395c7f3b2c17fab85f7591d3b40183851",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "46e6c9309cfdf56746e659992ef1de9846b9abae9156bd96d51bc7e631074e2b",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "46e6c9309cfdf56746e659992ef1de9846b9abae9156bd96d51bc7e631074e2b",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "f431add1ca5881d04caef9d2cf834248d8b4c36c7884221e39152c1aecd1ce56",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 34 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "a26c8225261bbd204014eb3df18b58b45a43594b8011910f3c5f560bc7171d33",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "a26c8225261bbd204014eb3df18b58b45a43594b8011910f3c5f560bc7171d33",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "b437b83f5cb648421f0bb85e107de9127f195722430d8a72eed57c1e7fd8d5a2",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "b437b83f5cb648421f0bb85e107de9127f195722430d8a72eed57c1e7fd8d5a2",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "b437b83f5cb648421f0bb85e107de9127f195722430d8a72eed57c1e7fd8d5a2",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "a26c8225261bbd204014eb3df18b58b45a43594b8011910f3c5f560bc7171d33",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "7c4e3e930c677e8235b9386af8748118563fc3c1797d3350e03d73022eb6bb75",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-x86_64-windows.zip",
                            "dlHash": "a1380d992acd656b3f518d6cf9d46594f025afdb9006d6bb126c871835164836",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "39dff0b192126db87c62b9f50042525c103796a456795000c5829a3f4a2c1583",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.8.0.0/haskell-language-server-1.8.0.0-aarch64-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.8.0.0",
                            "dlHash": "89baeb96588e05785d1e75687ea220c03ceb8a513e5b28ee042f2ed5acb448b8",
                        },
                    },
                },
            },
        },
        "1.9.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.9.0.0",
                "dlHash": "f62114928956090ea84c7e6b2fd16ca0d598c6d877e84dd87aebe81a9dabdd9c",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "775f08e3ae98b6b18c3db30ff66cd66017086c7d5aa57cf9de2b3f0b7e028d32",
                        },
                        ">= 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "9c625199d2ee8685c5b382ad4904ef18ae517e6bd7611258846125691b68199c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "9c625199d2ee8685c5b382ad4904ef18ae517e6bd7611258846125691b68199c",
                        },
                    },
                    "Linux_Ubuntu": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "6f83557bc11ba42dec56bd86e31002e2fb77159a6199c68e5ffeaf3f690a8530",
                        },
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "775f08e3ae98b6b18c3db30ff66cd66017086c7d5aa57cf9de2b3f0b7e028d32",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "edc1a02d2efa34ee48894c2e7309c8e8354954cfa7ae8c7bf45b25de98a03fb4",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "edc1a02d2efa34ee48894c2e7309c8e8354954cfa7ae8c7bf45b25de98a03fb4",
                        },
                        ">= 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "6f83557bc11ba42dec56bd86e31002e2fb77159a6199c68e5ffeaf3f690a8530",
                        },
                    },
                    "Linux_Fedora": {
                        "( >= 27 && < 34 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "bd6b5d596992d09c5380975f29a28f6591109e90dd7f3e63a8c93c90579e2964",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "bd6b5d596992d09c5380975f29a28f6591109e90dd7f3e63a8c93c90579e2964",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "e0f9ea5ae291ebbb26bb8eb9a4f0bd7e6595a2ecfd35ed9c76ed3286c585c00d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "e0f9ea5ae291ebbb26bb8eb9a4f0bd7e6595a2ecfd35ed9c76ed3286c585c00d",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "e0f9ea5ae291ebbb26bb8eb9a4f0bd7e6595a2ecfd35ed9c76ed3286c585c00d",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "bd6b5d596992d09c5380975f29a28f6591109e90dd7f3e63a8c93c90579e2964",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "a7c802b17a95a5fefd89be06537de0b61dce9956e68696743c06742e014c3fe1",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-x86_64-windows.zip",
                            "dlHash": "d3dcda136a712b023bc5f8a59eb4f1560a976fe74b9744103c92d29f39a750c9",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "b12397201d0f1e1a4325c29edadf69bf6ccca6e75c195e24ab0536e279547eb5",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.0.0/haskell-language-server-1.9.0.0-aarch64-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.0.0",
                            "dlHash": "4524c9e700a0a91670976f089dc2d7ed0d970420e93faf9ca1ad1246ec348011",
                        },
                    },
                },
            },
        },
        "1.9.1.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.9.1.0",
                "dlHash": "6876b043d4b203dff1a18f34e854384c03e9ad255920b9eb38a287f70f455868",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "654f4120e9e7c5b214f25525e1d903ab77e2a9fdd118d9e6d408d2a438a71147",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "29a1eb129b5086f20107e99387ff679980a11159ab415d097beddfc31c65cee1",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "2f5aaf652dd826c3f71420d99e1b876ac7dc8009317410cbaf6f30883f11a708",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "654f4120e9e7c5b214f25525e1d903ab77e2a9fdd118d9e6d408d2a438a71147",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "a9cf2067fd2db3ea2982322fc57391cb375c86bdf5f5e78c5cad0eaa1f96fc7e",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "f17fc86aaa581a1eba05c865a64bff90f62ade0a6a3cf93225227122b4c3fa06",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "a63de7ecd5d99aeab485614f9d10ce03d90293c2fe463245c8c2928f14c4ae63",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "81d667844a74aea5f98855c092b205465f1674782e63f3718a57f3ad942599ed",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "2a6e822bb419dfd4308d51b3b4473827bb71eb8829258665b6b37cc3896e2290",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "a63de7ecd5d99aeab485614f9d10ce03d90293c2fe463245c8c2928f14c4ae63",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "7348c0ad66f28fcb6af1efb40fffcd87375207b870555d267a1c5796beea9a67",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "b89a8032116be17b3fe3ba4896e18c89dc386b6e679e5fb12fcebba094eac5c3",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "7348c0ad66f28fcb6af1efb40fffcd87375207b870555d267a1c5796beea9a67",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "f351101775cb1cce986c4dec143e7aa710f4893603b89993bbd1bc14659c51d9",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "f351101775cb1cce986c4dec143e7aa710f4893603b89993bbd1bc14659c51d9",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "f351101775cb1cce986c4dec143e7aa710f4893603b89993bbd1bc14659c51d9",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "7348c0ad66f28fcb6af1efb40fffcd87375207b870555d267a1c5796beea9a67",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "21df7e1e9502139ea18b6f9256a06e4128a9387abf3c74ceba5b55b6d4a9bd94",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-mingw64.zip",
                            "dlHash": "e7b5f0f57f552e5096730e03cf691b03be8a2025eaf3f768e2d6ecf9dec96edd",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "3fecabf36bd643cc0b4e753186bb7b79a505eb3b01525cca09630267a94e850f",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "02674fa367ff52d13c759983fa21610eef6e1bf22381b51900e8dc9a73143964",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.9.1.0/haskell-language-server-1.9.1.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.9.1.0",
                            "dlHash": "5cbcfa0903bd776168a11c8ec437e8231699cd701d7b44496e9a2a3766fa08e9",
                        },
                    },
                },
            },
        },
        "1.10.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-1.10.0.0-wip",
                "dlHash": "dc73a89b43ed7f5f1823220a6873a6f5033d6140dde847526599b9fb41b2ed08",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "88ae4573e54d053e4f60eed47715b6d3e8d92ad4c66b1499902623ffcc780c1a",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "39de32e533993f9918822a1b6e370f618f60ec42aa84f10293d563571f0a6c97",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "41cc2665933005c7821fb18bac8cfaeb28b1ac588e297199df63fcd34e8ce84d",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "88ae4573e54d053e4f60eed47715b6d3e8d92ad4c66b1499902623ffcc780c1a",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "189bc3d2c1493b5e1fbf49c176c92136ce1e91dd449fbf2ebc044a0292869f38",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "c33f6a5bdc3f1bbc44a2db16c9330912b3ace2127007b6e19d8422c70dff3e4e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "54634827b11dad41d234b1b138d3c20752aa16e4368d285f2f1ceec373ccf7a7",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "46dfed0a072a0b03b44052c3dd13c6e71d12d35e0fe7d3f032f55e04c0ebcddc",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "0858611d2f1b3fa6973b116a49fab6e713c93e6a7c966af1ca3c5be164af289f",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "54634827b11dad41d234b1b138d3c20752aa16e4368d285f2f1ceec373ccf7a7",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "d9355647337122d4d51043b366d5ff498115ff86cba0f50580e158d7e4050451",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "44ee43b066662fdec41f72af0d0da74cd8d5444f0b1fefa42c4890b0b812cef4",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "d9355647337122d4d51043b366d5ff498115ff86cba0f50580e158d7e4050451",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "873d20a068398a52671f710f4fb06736f109752c03c2177950887125ccde18ca",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "873d20a068398a52671f710f4fb06736f109752c03c2177950887125ccde18ca",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "873d20a068398a52671f710f4fb06736f109752c03c2177950887125ccde18ca",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "b3cb7673dcff1fc39a2465b24fd744756331fd3cd48aed57bfbe66d274644cf6",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "66290c1368c2d65043779ad46b88ac271564f50d606f6e559e64ec26107a58a6",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-mingw64.zip",
                            "dlHash": "25e84ee35d7376b1e3b2ddb68808eaba77462d7d0fa2a849bf65dcde1265274e",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "843455de47a2e212b6cd2f06bf9530eeaae0e62c4ef8ba2b4115773b34fc34a1",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "f5e3b11e121c988905542450a3d9df18fb5ff38386862d3bffd4b5c3935d01dc",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-1.10.0.0/haskell-language-server-1.10.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-1.10.0.0",
                            "dlHash": "d2f46ec1ce923b74b575f8926f9b0992ab0f3ab8fa5d45590c641316f1e901af",
                        },
                    },
                },
            },
        },
        "2.0.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.0.0.0",
                "dlHash": "16b4e2ffd624a25130b0db69b0ebc0f51b2c0a8db0abe037d52066d5a513c0af",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "a971df81a80305e7757c905766fb0a1d0b8d904e0b5875156cefa6ad67d14448",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "488853d7ad7df122261faeea8e80571166ef3b9ae6e2ec4460371e4a930ae64e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "37d8337ad4804df586a381ede106e00673aabdcb10a70fcce2688d99eb1e377f",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "a971df81a80305e7757c905766fb0a1d0b8d904e0b5875156cefa6ad67d14448",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "f3922765ca75753499443b870f411b3b36dc5e38e9bb20fce6c2e3b514cfa893",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "397285fed0f30d4e9da2d404d9fde97930033ecd5133413057687ee78162aead",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "7afe2eb1131b40bd012858acb28d2ae9747e34683e37d7249644e71875e0f8c0",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "40193714e000ee8a791ea4dd273caf49c3fff25ecd6f7cd7022799d567001ac3",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "ae0a28539e11634c435822ed306c83540f8101674d1561691a758cba8ae99e46",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "7afe2eb1131b40bd012858acb28d2ae9747e34683e37d7249644e71875e0f8c0",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "12cee565ca3102b774048ecc4690e96b6e4bea93d956dfcfe2224ccf97dd6685",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "3d421836dcd4cf8d3cece267d41c9d64594666d807cb94a91c405b47965f5f3a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "12cee565ca3102b774048ecc4690e96b6e4bea93d956dfcfe2224ccf97dd6685",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "3353d21fb3f0271bfdf39fc5346b8a3fbff5f0bd43fb16715623cfc83b198e0c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "3353d21fb3f0271bfdf39fc5346b8a3fbff5f0bd43fb16715623cfc83b198e0c",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "3353d21fb3f0271bfdf39fc5346b8a3fbff5f0bd43fb16715623cfc83b198e0c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "62a1298105a801ad3ae588de0e3e4d6e58e79b3bca8fd214e854e230bdee5cc7",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "346a239281b4b81be1a93e1e7055cfc2ff87d628ad5f1a97f2b244af9c0310c8",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-mingw64.zip",
                            "dlHash": "3ffb11c54c3da6d9db29b2cf3f0231205de50753f50800ac524d5e7dd0245a70",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "766a15bf8e2fd06154be075e6d8431c6bfec36b1c648c36191f6861dc49e3fce",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "35c938cda22bd6f3b057ce8d0a2e9e6b10cad16c86452879f46f8749d09fa9b3",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.0/haskell-language-server-2.0.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.0",
                            "dlHash": "43a5b62b1bc4141d8a5ebc57cf8f5db09131f00ddbc3322a8356e27aff4cbfd7",
                        },
                    },
                },
            },
        },
        "2.0.0.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.0.0.1",
                "dlHash": "0fa212b8e80e21121276f2c0e57e6ad0fa96ca39d375917898f97616351bfa11",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "3aded2f20361f8998a40a7292c58188b30bcad860fa49869d895c848e131fac6",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "55aa4e462cf6735bb3d478d76c01bbdc14302564d1e07959f2c15c3311b2ec75",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "23bcec3019cebe7bf47ef84b4a9d118bb2b5b8584ae55e16b1d07e251125c4f7",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "3aded2f20361f8998a40a7292c58188b30bcad860fa49869d895c848e131fac6",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "bccccfee15649ab272bf02fd70395c3370cfa3a29eb9680cfbafae545d41e3ad",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "22b1b9c08bf20fc508bb6d87886adcd0819374acde4f207b812fbf7a2f0175d9",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "9cf15e0254a9b8860398d5d490a65c327bf7bc5b729a0e39cf9a5020cb1f65d6",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "ebf0dc79d4fd04e858379fd5c67988bd11b1fa571746b6ccd22575ab6ce0be2c",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "9e81898594763a11bbe88153e28183db13005d1360192df2a9478a4247aab293",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "9cf15e0254a9b8860398d5d490a65c327bf7bc5b729a0e39cf9a5020cb1f65d6",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "eba47e2a8cc7e1e6e0e1679fe3faccd20133f43b7942e1f1d13cab355a8dbd52",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "cf872e7efe250f0f40ce517c1f7486812abc9168822499a105fdd7737862188e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "eba47e2a8cc7e1e6e0e1679fe3faccd20133f43b7942e1f1d13cab355a8dbd52",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "4d555d3090f163064918a02d061fc73f69f164ae9c58c6b123cc0dd1260cd782",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "4d555d3090f163064918a02d061fc73f69f164ae9c58c6b123cc0dd1260cd782",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "4d555d3090f163064918a02d061fc73f69f164ae9c58c6b123cc0dd1260cd782",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "f8acb1bfb3048fca9c55da59d2d38cf956d13111032f2d68e4ed2f65d81d246e",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "27389eaea657f0be9df3feb675b42f76ce7ce58d13cb9e9048153bde39b19237",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-mingw64.zip",
                            "dlHash": "d45413cb987419ff25c01d3ce10df72aeeebc741c14e749e4af912a3c7268e4a",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "4fd4f67afe8e8434c3b3a3e93a0da76535b9967beedffad30aab8d31ffa35d98",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "ae99fcb78ccec49845d66a1bc6aeee39202964536226564fb4af91f7326db1a2",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.0.0.1/haskell-language-server-2.0.0.1-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.0.0.1",
                            "dlHash": "efaecd6221d4e55350e86350acc505af2678388b8e0689712dc44529ca1bc7d4",
                        },
                    },
                },
            },
        },
        "2.1.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.1.0.0",
                "dlHash": "c6f11f5b4129664993d6e86f7e845f66f9de90e7791a0e7e1d307b5f501f0916",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "b1eb6331bf69182eee086e68a0b4fd42eb0a008e35e177431770835bcfa9a16c",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "33195d128892a10deb453e5f720ebb77262e9be7b0efa05e53d926cfe01d66ef",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "38574562c96fcefed6cc954c2ca1745c4b7ba46dbd3fe4c2673e79318bff59da",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "b1eb6331bf69182eee086e68a0b4fd42eb0a008e35e177431770835bcfa9a16c",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "d3b59052c313826f3650e73cd3e4bba835092510df5ed62ef64c03db2a56cdce",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "7a19133f5aa91730ffbc8baa0c36873adebadab547b3e30651c7e84a14f08a03",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "0fad80136be327bb3f64a69fe223247ec3a4170214c5029b90c5a10889602fa2",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "20702549dd5ae7a66bbe57ea744651814f9b00a9750009f1f98e7d0c623b1b90",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "34698e17ecae52cdea6ee51702fd35281aa218a5d02918885e34fc0e9271fe90",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "0fad80136be327bb3f64a69fe223247ec3a4170214c5029b90c5a10889602fa2",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "ad033906a5ea2588969aa257757dfba73a7211491414974714f999ba5b6b8eeb",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "9ba4903cb9473961ba1cd640d7451034df34479d5e7c9314a9b9e212658e7b9e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "ad033906a5ea2588969aa257757dfba73a7211491414974714f999ba5b6b8eeb",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "fec78a8b2cfcde0594254e9e869defafe539068230ae3e723bc2c6dae199f98c",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "fec78a8b2cfcde0594254e9e869defafe539068230ae3e723bc2c6dae199f98c",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "fec78a8b2cfcde0594254e9e869defafe539068230ae3e723bc2c6dae199f98c",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "5b8b5c7fbb42782965bc860bb284d999b887fde006a8fcbe458e97fd2be6f565",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "5662451d72fa6191967ff7fcdc41928b38bf5a94263e3071bccd2b92e8a4b398",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-mingw64.zip",
                            "dlHash": "30aa0975694691eb62721c0c26a0ca7b34257e13cc5074d1633bd122a3bfe87b",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "7c7dd52f7832890a75b9c4723a731507e748c936dacf5c9e63aea98c3fa1658f",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "e55026c5e19c1800e0d0f81f917e11297fbd9cfffe19f49c43db4479f8a22251",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.1.0.0/haskell-language-server-2.1.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.1.0.0",
                            "dlHash": "dee63014af1ece4d49f88edcdd0396aaa03d1719966dc679118a725acd012060",
                        },
                    },
                },
            },
        },
        "2.2.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.2.0.0",
                "dlHash": "8e296ac5f5bc620258c45eea8ae578918b86686b79998a2f987c0132f6f95466",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "d19fc3825aad47f32c12ca5ac9befc230220ccef7ec7b777bd6d96e8051344cf",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "a39d15fbb2dc04c6de7f01f9a735930687488e064ea27e0b0b9bb845710d669e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "099e55dfd89df6e53d793af416b5bbfd2e7c666a9e25798dc0e00c74f965743f",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "d19fc3825aad47f32c12ca5ac9befc230220ccef7ec7b777bd6d96e8051344cf",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "dc667e281ee1c8822ae42079aa231b5ab5c8f225979866c8f2ec18cddaa405a1",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "8744442d1f2d28577c0a57c96ed337c38918627cb4690d7b989c4bdc563e72f4",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "237bd5add9ed41365ab6de2268a8ee50ad4b7300e9b24c2669a7a6e99afdc19b",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "50903f5f42330779172e8b8d16086baae9692c747924f8e2bf021e334e2f79cd",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "7b1bd6855ddde17268b24f37d0e77f29f5ff4ba582ca0c0812654361791ee4dd",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "237bd5add9ed41365ab6de2268a8ee50ad4b7300e9b24c2669a7a6e99afdc19b",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "e73da89c12cffb7cb824e21d1e89d7ef57c78c36e2311e6ede98784818b41afa",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "5859e6550c0390eb97f96a1aa14454a04249fa96a1b041f53d408a408e310f5d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "e73da89c12cffb7cb824e21d1e89d7ef57c78c36e2311e6ede98784818b41afa",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "af32370979ddd1719f7d3869154ead76f4b2a92aa86903753fb66f174ab240de",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "af32370979ddd1719f7d3869154ead76f4b2a92aa86903753fb66f174ab240de",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "af32370979ddd1719f7d3869154ead76f4b2a92aa86903753fb66f174ab240de",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "2fc5d2c770ba682bf1566c5ddd72752b9c13eceea464a5c526cfe4bfa98d4013",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "9c9a2573a0e5fc57de0cb8998384ba2eb51ded4b99879b67fd68f2d72af553c7",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-mingw64.zip",
                            "dlHash": "92aa453140af26d7d610a48a52bbe44dc8ae542f6c68a8a3f8f0b90123f58071",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "d14fbe1a18766a2f900ed70ab3484ed45241bcb5deb9e87f05b4d82d98fc7a08",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "8e9f9fd6aea488af8ae2918443ea83d23879a35ec702c8dbdcf79a4a817dd50e",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.2.0.0/haskell-language-server-2.2.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.2.0.0",
                            "dlHash": "9e7af7aace18e6d0a42640fd50e3b8ca14c4b23cefa9c3422d9ce311d8554c5e",
                        },
                    },
                },
            },
        },
        "2.3.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.3.0.0",
                "dlHash": "4e86fd0d837ffdc808c79713fa9532d4b9e52bbc1066aa925d8ff3f65d9facf5",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "c8abeeb0c64bb5a0ac6443e3230736d8908d09a6e2c9c2a2dd7613588646f942",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "e3e40f9eb0494c80a5b09920f93dc96120b5b352148ee9ee4eb4f8714a1434f6",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "f5e1738add49c408386b08a8c95c8e961a0b3bf7d5970dbd03f8e984c561b633",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "c8abeeb0c64bb5a0ac6443e3230736d8908d09a6e2c9c2a2dd7613588646f942",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "f04063a0d91863036bbc4dde8137f9e8a34c191e3f30458c2bbe688bafed09eb",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "5031f969ba338833cd8093fa9e9d6427b5f7f87ca45558ab622e3a5d60efd791",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "9f2bb05ccdcf972c64f6affc5af011479f3239b71dbccbc8e122fa2ad65db766",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "7a64e73f84870293458f402b6ab83b3183c00216ac3281829ff166a6ec38e5e1",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "192c08e48e27009f0226fff9ce51a2dfd8f79eba3952943d6f9697a41e648f14",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "9f2bb05ccdcf972c64f6affc5af011479f3239b71dbccbc8e122fa2ad65db766",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "a1bbdc713aec74536804a52cc4ea9d4e98072fad2193b4da60f6d6f468328b1f",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "e32b314fceb0ae923059e467a1d0c80a956c53a7f6206f478f95d4a10004f5bf",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "a1bbdc713aec74536804a52cc4ea9d4e98072fad2193b4da60f6d6f468328b1f",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "4f62160c6cf633192c6acdde26df26fe968ac285fb576166f95886cea2add300",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "4f62160c6cf633192c6acdde26df26fe968ac285fb576166f95886cea2add300",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "4f62160c6cf633192c6acdde26df26fe968ac285fb576166f95886cea2add300",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "33ae7f6ffcf8ba4517275d9950d00801b63c9cc70decb641bb46ee315d1d22ae",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "517c0c8088cbca7dd48c37d7dbe7457a8b49643cedeedf5064babb60d4c84c00",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-mingw64.zip",
                            "dlHash": "741682b29153dbf33ca12cde29a54ca0486d51aa8d8ed01078cbd39bd1a002a3",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "d9a032708f13d2a0e270acbc5b81ea34f215f23f1c6090e5ec99b41540646c90",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "a54170d705ca56e7066e8c8a2f96c7bef80b4476e1692943c65b88375660a0f9",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.3.0.0/haskell-language-server-2.3.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.3.0.0",
                            "dlHash": "bb16e491117b7677742ca730b741b0d8154aa3222bbaa8578d487eda5152910a",
                        },
                    },
                },
            },
        },
        "2.4.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.4.0.0",
                "dlHash": "398631d6fdd7208d77c939f6142a88d88ecbbbd323ccb40199d8dfe6efde7190",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "0d3a33bb474d7517f453bbbb344fc1cb38b46c3cc72454929c0accb6d16ea77f",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "ac26c6d8648308247929102ed4a9fccbfb8d6245aa304b741b8317556b3110a9",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "9506fa48147f80edd3b1526d02ca99f242e84dd21619119b8d8e38872783296a",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "0d3a33bb474d7517f453bbbb344fc1cb38b46c3cc72454929c0accb6d16ea77f",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "c2a369f3512e31ffad6791e91e75e96597137388c6bd6eb632f20bc862d4db00",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "f4fba08c5ada13d243354274adfda286e95805e85e49cf459d3ab0ca212e7070",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "c61f4e2d5f49ee28263c3d975ba62f43a71e406f6d0579921ddf15d077bed269",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "e4634ea0353e1d4300315ff1b48f0bb787602ddbc7a82e443765a577f071eb0d",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "6236f2f92fea035ed2630a67b21bffd820227d54b674e3a6dfd8b0c96201979a",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "c61f4e2d5f49ee28263c3d975ba62f43a71e406f6d0579921ddf15d077bed269",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "f564c46a73a725b3557ed4a459d76ada2f50aa82841bb47e21179649362928d9",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "03330ed40f733d985a51abab3640d3dc887186c0c5a12823689c844dc25322f2",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "f564c46a73a725b3557ed4a459d76ada2f50aa82841bb47e21179649362928d9",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "a4de2a57fdc214efb85f8e976013759ddf4782034c7b4e35942adfb151e604b6",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "a4de2a57fdc214efb85f8e976013759ddf4782034c7b4e35942adfb151e604b6",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "a4de2a57fdc214efb85f8e976013759ddf4782034c7b4e35942adfb151e604b6",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "24341c64725217bfb748d640a100a4c7c6c350f7b41a5c4be871458b79b45913",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "aecb93090ded96d76a11aad3cc4849c5c00faad9491856a020218aa6083409d8",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-mingw64.zip",
                            "dlHash": "be469b863e509705a26d776c798812cc12e757a76ce6bb58c26324ef3a03ab92",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "311cb78a98ded13a4eb704bbc0d5c893775743bea2977fe635f911e21d1c0114",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "2f7ef3e1ae1b40438e2d95218139f2e6985b3df15bc133aedab20c4686cfda20",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.4.0.0/haskell-language-server-2.4.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.4.0.0",
                            "dlHash": "74cfa47f961ac5607055ca2f400b471a535e7b982e910e187c7c1303b048eeaf",
                        },
                    },
                },
            },
        },
        "2.5.0.0": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.5.0.0",
                "dlHash": "515bbff3eca30a5d584f9a0b1b64651f9bd0ea666888c70e31692a1c95528c36",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "ba336f29647492134509e83da0cc8c8ecfbe3d264bd2c6825a1f00344f602e53",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "9503db02a03e3d50d78b42b866fb32478dedb9906d278dd1ad4432740b3d3d36",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "fe8e97dd6de79b6df1b0138ee2090d392b85cbf7df13d1efa8a3827091cfef48",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "ba336f29647492134509e83da0cc8c8ecfbe3d264bd2c6825a1f00344f602e53",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "d43e4858ff798c147a7c12f5d92cf8ca1fa345e7da3f3c1f05acf7bd0f83ee26",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "7c1800a7af1bf5777114aa7e96cca94fdf6b34dc839a7eb3ad725e28efac0250",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "641888bc81570f8c66d7def5f05d64419b29d51e1d61b2470f4076555b54d5e7",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "49944981fa4b6489aace7b7c1ab71a5c8b2f650c50cd6e5dad8fb107a11f042a",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "4ff9d1edf6b07f6339680580d73afb2f1004189da4751fe205d0e5d6f48f83bf",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "641888bc81570f8c66d7def5f05d64419b29d51e1d61b2470f4076555b54d5e7",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "a1d321c098949635d5e83d85a14d472ce874884096843fbfccc74cbda9d6a162",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "f2c233ee6f788cbf337c55fcaf0902fd1e363f581979437735c90483f97c5cd7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "a1d321c098949635d5e83d85a14d472ce874884096843fbfccc74cbda9d6a162",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "34f643436b3e2e2a68a1d89ff1db7c3c0bde25af27de981b513aa8cdbfb5ca9e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "34f643436b3e2e2a68a1d89ff1db7c3c0bde25af27de981b513aa8cdbfb5ca9e",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "34f643436b3e2e2a68a1d89ff1db7c3c0bde25af27de981b513aa8cdbfb5ca9e",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "79bdb285910a6940ddb7961ea0ffad1e5f9101afdcc332355dc5c67b821775c9",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "189e7dadad22d330052f5257c9724f834e1373ea3213f0b12a4a1b8a9c45a62e",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-x86_64-mingw64.zip",
                            "dlHash": "15a2536e30ee0f5cd226a3f37f907f1a1121ce9ff451d1b7b738138fdb17d699",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.5.0.0/haskell-language-server-2.5.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "17662583522bd48a5e1f580cb6d7abc6d77c871e274fda77c1216131be39546b",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-aarch64-linux-ubuntu20.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "47b5daf644cbfafc097470cdde7add6060f9fd27e0d4b746ccd11f8d23524c16",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~hls/haskell-language-server-2.5.0.0/haskell-language-server-2.5.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.5.0.0",
                            "dlHash": "2e5083ebf7fc9dd3c5aa31059f9336bec4407fffb21b93a20decb49e9cf880a4",
                        },
                    },
                },
            },
        },
        "2.6.0.0": {
            "viTags": [],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.6.0.0",
                "dlHash": "5edbd8834c4615e05da37d3edf0b949f865124f3d4990c9575264a4d64ee947a",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "515f9c4c85a4f4575b49a6afea77092342269d827b3dcfb79024e0f15350fd45",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "a47d4339552e798d254762ac425bc6b1cef1e8c798c8a54d5119806f710db76f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "f2ea17feb2cbad67f6d0224e4c693edf253ba32550aa37f53d130e53d5b074f9",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "515f9c4c85a4f4575b49a6afea77092342269d827b3dcfb79024e0f15350fd45",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "ebe7d39a3c290e9dfffbbc8889600b5cc577fd94a20c08b42dfb530ac70b04d9",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "a48946ea26425a1485b0de4fca2a7779cf2484cafa57183a5e161556ec3940ba",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "dd9600adce402994629d71706bfaf9316572ecd0e6e1ec4a55da488639f126d4",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "0fb742ffe3bf9a8233a2e5f1ce0cdf75d6547ca71be7111e0d77a6ec589accd7",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-mint20.2.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "2c78471619ee6aa476e261e610f35875f7ce469030abc71c67da2f444aa5767e",
                        },
                        ">= 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "dd9600adce402994629d71706bfaf9316572ecd0e6e1ec4a55da488639f126d4",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "7c975b250727e5b9c9f228eb1076a8f3d2deff29c14f3bd0af64ae35783cb02d",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "2056382f58e169217770fc7efd05efde88701bdcc54a00593ec71acfb55d2754",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "7c975b250727e5b9c9f228eb1076a8f3d2deff29c14f3bd0af64ae35783cb02d",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "859bf41c7cb9cc2143ac0784a0c6098c1eba60cb97accd8fa4385b422529f835",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "859bf41c7cb9cc2143ac0784a0c6098c1eba60cb97accd8fa4385b422529f835",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "859bf41c7cb9cc2143ac0784a0c6098c1eba60cb97accd8fa4385b422529f835",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-unknown.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "f4a446cc60ec9f13d2439d518d668287f659ad3af2ec42144ce02748f4ac6ff1",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-linux-alpine.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "3fdbdb08cbdf84974081dc1ff96316fed8c911eb3b0e023387a449fcb25ea0da",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "d5042d86c36beba516ffc69d292b36f3ec9623ffff10a0d858f64b0d448607c2",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-mingw64.zip",
                            "dlHash": "9c0ce050bf17dbfa190f17bfcd3ed752c5cee019855dfcb0b3bf3e23a0ff4f4e",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-x86_64-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "89ced43317de453ff60024c2fd8670b86bd48d10815522c9b018db8adcf5be44",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "00a070a42125dc09f83ca42686a0a0e9a0d43833ba005a6edfd631b078743cf5",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.6.0.0/haskell-language-server-2.6.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.6.0.0",
                            "dlHash": "b6ddeef8aeb1d743d528ed4e6a1ed19315e166921997b43f075f36d3f3f845c1",
                        },
                    },
                },
            },
        },
        "2.7.0.0": {
            "viTags": [],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.7.0.0",
                "dlHash": "33917732b304da8500c74842585d923574e58d62d66971e4dd443c3a892cd553",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "ce2a8048d9784402f0da1d6e3f00e421fad0c1f8a85c939c8638729b869a1331",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "fab0a1b8f0e9d32d770a7567042edce0c5aa705dde4d646c674ee9f9d65e1c0e",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "3202418b18827fbe6a5d16991bfb8beaffc705ca8f6ade0fc9cf0e9a6ced5b27",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "58fd3e2e57986eb921de306a461647e5cdf4fc0b82087338c9e32f52d6f420aa",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "58fd3e2e57986eb921de306a461647e5cdf4fc0b82087338c9e32f52d6f420aa",
                        },
                    },
                    "Linux_Ubuntu": {
                        "( >= 16 && < 18 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "ce2a8048d9784402f0da1d6e3f00e421fad0c1f8a85c939c8638729b869a1331",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "9d9e4cbcc447c7dd6d8e4dd33f3c5decab580d67ca6cb5ccc3ea10452145eeeb",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "578002a0022ca55604f48f0bd7671412710f1fa1ca06a19420fbf46956b5ddbb",
                        },
                        "( >= 22 && < 23 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "7bf11bfc493ad2deb9b4f0e535fad4e465aee9ca159aa36c02a641b619385e36",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "7bf11bfc493ad2deb9b4f0e535fad4e465aee9ca159aa36c02a641b619385e36",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "20a1d899caf6843a2b8cfba7c3eda6f14874a88bfd2e5dfc89f21c9a62378c62",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-mint20.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "3c6e7ef1519ebafadbb63834f7ade3ebdc8c0f9b743cc488294173ea37cf6187",
                        },
                        "(>= 21 && < 22)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "7a8e3e9fd287af1ac3b95785c7b618da87257e19e6fc061ebc04030b2d857a7f",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "7a8e3e9fd287af1ac3b95785c7b618da87257e19e6fc061ebc04030b2d857a7f",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "8e17285036d0b6852c58e9a63b43fd1f43f9a227a0dc8e9eab1a0991923e9fe6",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "83b789614721bdebcdb23a49fffebcc081b090b7eb76f940429a0c5d72ced6e9",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "8e17285036d0b6852c58e9a63b43fd1f43f9a227a0dc8e9eab1a0991923e9fe6",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "4048ed8c919e2c789028c584c6d91fc819944c2b966897fd8a06aebdbe040090",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "4048ed8c919e2c789028c584c6d91fc819944c2b966897fd8a06aebdbe040090",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "4048ed8c919e2c789028c584c6d91fc819944c2b966897fd8a06aebdbe040090",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "7542fd2aaaf732367f6ed1f4bd6872f02bc6a5b5c779d63e03bfd3868feb111f",
                        },
                        "( >= 9 && < 10 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "3a61aa0351b54c719fe7f80ee1715050b563f4b006658d283186782f3822d2bc",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "3a61aa0351b54c719fe7f80ee1715050b563f4b006658d283186782f3822d2bc",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "7542fd2aaaf732367f6ed1f4bd6872f02bc6a5b5c779d63e03bfd3868feb111f",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-linux-alpine.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "6712f75360b9875323b79eb24b46b329e82877063f0195f0b5e9c899b3209cbe",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "1f072140fb00d12c305bc4a893d72b99450f083eb536c91f813c042730ce7ace",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-mingw64.zip",
                            "dlHash": "11d0df8f7cb8ee122b490788f655a4430ee9b351cddf2dbe9b9bdc9f26d4eed8",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "40e91b0dc6023dbb04e8522ee8b3ca0f40f0018ba5a1772c094d80c9da96d627",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "1ab0ccd4c610bec1240edd7ebb022725f2ec3a9f7c03f0d8fd91b80c94c1f512",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.7.0.0/haskell-language-server-2.7.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.7.0.0",
                            "dlHash": "291bca876044031c62b0b216332a11f3e3c8adce6259a6bc99270618d25a2378",
                        },
                    },
                },
            },
        },
        "2.8.0.0": {
            "viTags": [],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.8.0.0",
                "dlHash": "f77685eafc3b271f943d68a04ed7a88f033d3e2b8b0e4e57eb7bcc46703bc238",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "318b1a5e3a9ce6a0928aabc6d9e94f7a4b4b79e2c02675243d1b3005621b99e4",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "e3c14b8a68fcb4d5204fb0ef7a67c89fc38dfb77bb2e4155f11fb24d81b75be9",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "3b6855ca9193e48787852a2348e53f3df0a2da16839316f1cb2e03433af9d9bd",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "999977fc0d1e81954a311da275ac2660b91427eaaed6ee0b063190f7837d68f7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "999977fc0d1e81954a311da275ac2660b91427eaaed6ee0b063190f7837d68f7",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 18": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "318b1a5e3a9ce6a0928aabc6d9e94f7a4b4b79e2c02675243d1b3005621b99e4",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "2c113ef56584fe5f7f153bfb268d2bcb23a4662232642a6f074cc320e213d4a5",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "8e804785b926bd282292785b3607ed19947b1b30122c453d47f4a358b2ddb83e",
                        },
                        "( >= 22 && < 23 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "59c34b36aec3b7b2ceeda8e31df2b8731c19cfa7d4cd20c8fe54067f3150a071",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "59c34b36aec3b7b2ceeda8e31df2b8731c19cfa7d4cd20c8fe54067f3150a071",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "2db1994c9715a6feaec656a05aa4c470874a0d068d9574c7763ad541e048a462",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-mint20.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "4db18fec01cf75b3c0b5b6c8af552fbbfe705a6b8c40f252170ab122f94d2d0d",
                        },
                        "(>= 21 && < 22)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "6165ab298502daf64fd1760298e5811137818b12aadd1d9d73d0e5c3707b8272",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "6165ab298502daf64fd1760298e5811137818b12aadd1d9d73d0e5c3707b8272",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "501e08738829aaf303d6427745a6962059c8f7f5b3bff1be4fff6f0e0d440041",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "ab55f5b9567343e9b93b81bcd43f5547e021af37706b5bd7c3d8aae0a1e06ca9",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "501e08738829aaf303d6427745a6962059c8f7f5b3bff1be4fff6f0e0d440041",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "13ac945b68c7b7e9a11c0960dfa4e46eb008337947ccacb183a9a48394246976",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "13ac945b68c7b7e9a11c0960dfa4e46eb008337947ccacb183a9a48394246976",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "13ac945b68c7b7e9a11c0960dfa4e46eb008337947ccacb183a9a48394246976",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "a69d4899254a42c4c9b4676e82646390c4ee394c1850f7d8102bb9d9151815f4",
                        },
                        "( >= 9 && < 10 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "f7682792d4251a7001ddc895e5605f1a93ac620fff80f165f5f057d6da752b5e",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "f7682792d4251a7001ddc895e5605f1a93ac620fff80f165f5f057d6da752b5e",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "a69d4899254a42c4c9b4676e82646390c4ee394c1850f7d8102bb9d9151815f4",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-linux-alpine.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "6a5fa87e5298de87fc413a7c851a913eea5ebef00f8580f9b305d48185c406eb",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "d1394766baf3b0c8afd7089ff15381f3c93ac48e97fb0b591ba0df8bda7dca43",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-mingw64.zip",
                            "dlHash": "8e5fb0b0a2c53d4cdecf9fd7966e72168cf7ad8962cf7eec58491f7218318f24",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "b30e0987479ed941ff9a6b34076c0a3dc5e265fe1d4f2892f6b2ade633720e96",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "545050bd22086c72fc17c50fac6fa4f67727e753ba71ef5cbd03b72964e90376",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.8.0.0/haskell-language-server-2.8.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.8.0.0",
                            "dlHash": "f5306fe1fcc13f2e0d7df1fe38ecb22f60f6506350e58bfb255ee670e4af0fac",
                        },
                    },
                },
            },
        },
        "2.9.0.0": {
            "viTags": [],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.9.0.0",
                "dlHash": "670fa4781314df03e21869391ba727a8c1b75b5a035b6f5ba5fca68d5499e3be",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 10": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8ae7f1b515b122ac21a4f10f87d84d7f6ee343d8723fac36ed30a9f489ceff30",
                        },
                        "(>= 10 && < 11)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "6cc412b525945ccc42ce42e6d9d5007eed592eb9939c46e07974074eea415a00",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "a7459c597fb78c8ef7d279c6608b81d75a2417f27e9e7584b45822ca6c636b22",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "1b0e203b6f49d4fa500bd6cad1c3fc51de94d3e802edb3231ff518c7861660e3",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "1b0e203b6f49d4fa500bd6cad1c3fc51de94d3e802edb3231ff518c7861660e3",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 18": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-deb9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8ae7f1b515b122ac21a4f10f87d84d7f6ee343d8723fac36ed30a9f489ceff30",
                        },
                        "( >= 18 && < 19 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-ubuntu18.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8f3dd57be682ecee02030ce8a22249cc69dafc37a04b0c1f074c4e24f22a2413",
                        },
                        "( >= 20 && < 22 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "99025030cead43e27175a6ef3297708993441a1dc9a069206d3c904dfc345f83",
                        },
                        "( >= 22 && < 23 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "d98ad88f36c432e61fc5ea5373f4d33caef6f6d86e6e3c2f4ba7982488bf6421",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "d98ad88f36c432e61fc5ea5373f4d33caef6f6d86e6e3c2f4ba7982488bf6421",
                        },
                    },
                    "Linux_Mint": {
                        "< 20": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-mint19.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "9f191a3ad1f6b547a684f7e6bc53465093b4570608f256e664e040c04e7982a7",
                        },
                        "(>= 20 && < 21)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-mint20.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "a630a45ae79062bff860be0059b750c3e21f0880fb398668c8249a4798830bec",
                        },
                        "(>= 21 && < 22)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "fbf51b16fd3bba75992bbbd7062ad2a4b1f979721e778574ef27b2767584bfcd",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "fbf51b16fd3bba75992bbbd7062ad2a4b1f979721e778574ef27b2767584bfcd",
                        },
                    },
                    "Linux_Fedora": {
                        "< 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "0a818de4dd3252392896009190f5d2811a2aeed348cf896902a4bf04e9d92d48",
                        },
                        ">= 33": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8e91af6096700c2155df7c425cbf867b76f8b8c97ac06c34ee0ade1468583a5a",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-fedora27.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "0a818de4dd3252392896009190f5d2811a2aeed348cf896902a4bf04e9d92d48",
                        },
                    },
                    "Linux_CentOS": {
                        "( >= 7 && < 8 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "b71a0ff07897b027a9612ce2c75f67a0c039b5eb8259ed2290a70457e2b7d5ab",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-centos7.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "b71a0ff07897b027a9612ce2c75f67a0c039b5eb8259ed2290a70457e2b7d5ab",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8fd7d754f42773a8130a0876888993b9c63850f7a8ea747860b4e96c44c397e9",
                        },
                        "( >= 9 && < 10 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "7cadadf41056f63a27b30091fc6a056667f24eb068aae0ad763bd4380e9eeba7",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "7cadadf41056f63a27b30091fc6a056667f24eb068aae0ad763bd4380e9eeba7",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8fd7d754f42773a8130a0876888993b9c63850f7a8ea747860b4e96c44c397e9",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-linux-alpine.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "877aed721cd5ce9d8a58e80c05be673577502bf3f700b97f65c8f7b7eb764746",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "8babf286fb7eae21cb6f7a63a77af1104bdb24bb3a5c72082ff47ca48fbc3dd2",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-mingw64.zip",
                            "dlHash": "c87cb5aade03f166acee44ad312628bf9e3c83aeaaf1061065968634d29026a5",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "bb956cea1d9bc6308dc1dd1e6077e515a12b80a31ad0d62a09ac4ae8f9fff2b1",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "cd3c1e2ea9c17d21a42223758adfc708880528c54be970d88a1857e8c9c2a86a",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.0/haskell-language-server-2.9.0.0-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.0",
                            "dlHash": "36339f20c12bf54aa4a55c2d0e706a0d41ebdc20780ab5a4b890ad8f019dae16",
                        },
                    },
                },
            },
        },
        "2.9.0.1": {
            "viTags": [
                "Latest",
                "Recommended",
            ],
            "viChangeLog": "https://github.com/haskell/haskell-language-server/blob/master/ChangeLog.md",
            "viPostInstall": "This is just the server part of your LSP configuration. Consult the README on how to\nconfigure HLS, your project and your LSP client in your editor:\n  https://haskell-language-server.readthedocs.io/en/stable/\n",
            "viSourceDL": {
                "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-src.tar.gz",
                "dlSubdir": "haskell-language-server-2.9.0.1",
                "dlHash": "ae42a2e76ce6aa5346416b6448bbca1427b9b96f17195f5029eacc639825d6c3",
            },
            "viArch": {
                "A_64": {
                    "Linux_Debian": {
                        "< 11": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "9f0ad22ad450cdffbb32dd29b4773528f0b9380f110985a67d734aade4bb03e0",
                        },
                        "(>= 11 && < 12)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-deb11.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "fbed3f5a792938e9e5359eb4e3eb2fc556adb5a65dc86a28fb82a2e3a9a1a1d8",
                        },
                        "(>= 12 && < 13)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "4169464a6ca82463e92eb0b196faaf827b20ab6e3d172f9e1a7fa1dc92bed865",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-deb12.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "4169464a6ca82463e92eb0b196faaf827b20ab6e3d172f9e1a7fa1dc92bed865",
                        },
                    },
                    "Linux_Ubuntu": {
                        "< 22": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-ubuntu20.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "5f3b6cb334197227a6f321f4f80a98d7aa941d1d38a9e065ed8b395e3f111de8",
                        },
                        "( >= 22 && < 24 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "1107d761a685539ea88a904c7a55ea35eb6cc9bece90ec18d37d139f983f47f1",
                        },
                        "( >= 24 && < 25 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-ubuntu24.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "e281036add3cb098f8c4e9408809128c86a82b96d5db3b219461f4345f5d9bec",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-ubuntu22.04.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "1107d761a685539ea88a904c7a55ea35eb6cc9bece90ec18d37d139f983f47f1",
                        },
                    },
                    "Linux_Mint": {
                        "< 21": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-mint20.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "770940af5d02dad858ed264e280504c011eaca7d041e006c829e0cf43a8ee310",
                        },
                        "(>= 21 && < 22)": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "dc1b3dab631489b735d932c8ca0e458f2afd9f15c01d1b09cab90dff3baf948b",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-mint21.3.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "dc1b3dab631489b735d932c8ca0e458f2afd9f15c01d1b09cab90dff3baf948b",
                        },
                    },
                    "Linux_Fedora": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-fedora33.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "0626364dc2926f0a62919cfd4eee39c452197b8a794486240877f89010f701ed",
                        },
                    },
                    "Linux_Rocky": {
                        "( >= 8 && < 9 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "b6b3d51a483dc58f48055d15cb048843bd7b580e1d7262db04571a03c6adcb09",
                        },
                        "( >= 9 && < 10 )": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "64909a9b7f742207be8c14b7a2de087522686bae41d7631adf756d3f52026e0d",
                        },
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-rocky9.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "64909a9b7f742207be8c14b7a2de087522686bae41d7631adf756d3f52026e0d",
                        },
                    },
                    "Linux_RedHat": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "b6b3d51a483dc58f48055d15cb048843bd7b580e1d7262db04571a03c6adcb09",
                        },
                    },
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-rocky8.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "b6b3d51a483dc58f48055d15cb048843bd7b580e1d7262db04571a03c6adcb09",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-linux-alpine.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "f1a8d016a770a259c8dcc451a653e9c78e82d830f49bd773e9afb94e7b6c4a9c",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "a7e2d7229fa50b592746214aa743c2bc93dec367cb397d40cf3e8165628ae7bf",
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-mingw64.zip",
                            "dlHash": "e1ed24a3fc50d211012989fb545182f858e37a194c51110ebdf422feccf9cfac",
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-x86_64-portbld-freebsd.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "059ed14ee5a11aeb3b04ebde3f3777f963a8993e21995fca9fa24f600e205f67",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-aarch64-linux-deb10.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "6e347925fd3bdb0428b87b6b7084a39aa311f4202d6a22f360274785960f4678",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/haskell-language-server/2.9.0.1/haskell-language-server-2.9.0.1-aarch64-apple-darwin.tar.xz",
                            "dlSubdir": "haskell-language-server-2.9.0.1",
                            "dlHash": "9e1208ca7facd003b15298bd05d4a132f57c3d9bfe8c888e83ce960343f7f1c0",
                        },
                    },
                },
            },
        },
    },
    "Stack": {
        "2.5.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v251",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.5.1/stack-2.5.1-linux-x86_64.tar.gz",
                            "dlHash": "c83b6c93d6541c0bce2175085a04062020f4160a86116e20f3b343b562f2d1e8",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.5.1/stack-2.5.1-osx-x86_64.tar.gz",
                            "dlHash": "f4aedfa8fbe371f77286ee97ec5c3c553842e7ae15b2952a8b8442dccba04bf0",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.5.1/stack-2.5.1-windows-x86_64.tar.gz",
                            "dlHash": "57150b422cfd42249f5e629d0eb678df6d95dabe486ced57e8298d300b940d41",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.5.1/stack-2.5.1-linux-x86_64.tar.gz",
                            "dlHash": "c83b6c93d6541c0bce2175085a04062020f4160a86116e20f3b343b562f2d1e8",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.7.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v271",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.1/stack-2.7.1-linux-x86_64.tar.gz",
                            "dlHash": "2bc47749ee4be5eccb52a2d4a6a00b0f3b28b92517742b40c675836d7db2777d",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.1/stack-2.7.1-osx-x86_64.tar.gz",
                            "dlHash": "4248c6fbc87e8a2c06f39e867eb5ef28eae0d99470137cb415356c631c0dcbf2",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.1/stack-2.7.1-windows-x86_64.tar.gz",
                            "dlHash": "8452f5fc9235620a84863f2f68e5f681c72d0d181cde50482f178a966ee0ceb9",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.1/stack-2.7.1-linux-x86_64.tar.gz",
                            "dlHash": "2bc47749ee4be5eccb52a2d4a6a00b0f3b28b92517742b40c675836d7db2777d",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.7.3": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v273",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viReleaseDay": "2022-02-02",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.3/stack-2.7.3-linux-x86_64.tar.gz",
                            "dlHash": "a6c090555fa1c64aa61c29aa4449765a51d79e870cf759cde192937cd614e72b",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.3/stack-2.7.3-osx-x86_64.tar.gz",
                            "dlHash": "42e5000a00af44a7b26852421ac63ce75f510ad1a97742cb131107088ee9fe30",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.3/stack-2.7.3-windows-x86_64.tar.gz",
                            "dlHash": "e6ba12e0ecabf0df2567d88a0d247da238bc114bcccfca4195f5e86472c9330c",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        ">= 12": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.3/stack-2.7.3-freebsd-x86_64.tar.gz",
                            "dlHash": "000ffd88795b628b1438266827894f6af1c5d020217610eda19962915dd935b3",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.3/stack-2.7.3-linux-x86_64.tar.gz",
                            "dlHash": "a6c090555fa1c64aa61c29aa4449765a51d79e870cf759cde192937cd614e72b",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.3/stack-2.7.3-linux-i386.tar.gz",
                            "dlHash": "507730fcee5289c90811633d48d3ec437f165eec9c700908bbfc1e21c226effd",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.3/stack-2.7.3-linux-i386.tar.gz",
                            "dlHash": "507730fcee5289c90811633d48d3ec437f165eec9c700908bbfc1e21c226effd",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.3/stack-2.7.3-linux-aarch64.tar.gz",
                            "dlHash": "d9721a46fcff2d9873c1bb6310116e21b0a6923fc5c952849843d27f0225c2a2",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.3/stack-2.7.3-osx-aarch64.tar.gz",
                            "dlHash": "9abaf77787cdad8c2db97a087c6295f197f256181602b4424f03220ae21b47d9",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.3/stack-2.7.3-linux-armv7.tar.gz",
                            "dlHash": "3e22c66ea38525ca2ee5b0d222c8aa193c50152a53ff2c80ae179a40592512fe",
                        },
                    },
                },
            },
        },
        "2.7.5": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v275",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.5/stack-2.7.5-linux-x86_64-static.tar.gz",
                            "dlHash": "2a02fefefcc1758033d0aea566a521a290e3c68739ce9894bd6492a346af79c5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.5/stack-2.7.5-osx-x86_64.tar.gz",
                            "dlHash": "94176b71425d76b94b088515103316ae1ff96d123344b1f4609c103d0d5bdcc4",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.5/stack-2.7.5-windows-x86_64.tar.gz",
                            "dlHash": "c9b07982590d63db2310a44bfcf33c9f8bd84a0828abc17b2a394e90fbf6a914",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        ">= 12": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.5/stack-2.7.5-freebsd-x86_64.tar.gz",
                            "dlHash": "fceb15b22d3dbd8d25cb84ad66a2eb71a5034f7e2c47a74f25141994feee7c36",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.7.5/stack-2.7.5-linux-x86_64-static.tar.gz",
                            "dlHash": "2a02fefefcc1758033d0aea566a521a290e3c68739ce9894bd6492a346af79c5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.5/stack-2.7.5-linux-i386.tar.gz",
                            "dlHash": "a679eaebe627444fe17fc794ddfb3fe9ee4281a4e9e9137cb04318873e23a2f6",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.5/stack-2.7.5-linux-i386.tar.gz",
                            "dlHash": "a679eaebe627444fe17fc794ddfb3fe9ee4281a4e9e9137cb04318873e23a2f6",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.5/stack-2.7.5-linux-aarch64.tar.gz",
                            "dlHash": "f362fa4786b17252004b2619ec96b9687e561dc4e55c2612c53d60be767cabba",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.5/stack-2.7.5-osx-aarch64.tar.gz",
                            "dlHash": "cea34367981ed6f5629d23d17957920b1a06cc0a00580ba62e960a64087f25fe",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.7.5/stack-2.7.5-linux-armv7.tar.gz",
                            "dlHash": "8be2342deea5309a32e28a0c5eb341ea9557401f08484676036471250ca12e21",
                        },
                    },
                },
            },
        },
        "2.9.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v291",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.1/stack-2.9.1-linux-x86_64-static.tar.gz",
                            "dlHash": "cd8ef4a844f141159189899a128a33f4beb9ec4e66ac96fc2ada47a626a9d462",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.1/stack-2.9.1-osx-x86_64.tar.gz",
                            "dlHash": "53f13c2a12953ec1660635d3f20e5036a7169de3ad58bd52e513687e19fc71c6",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.1/stack-2.9.1-windows-x86_64.tar.gz",
                            "dlHash": "6aea769fcf0f6ae2596e52ef390a712a67285906600a374bbb759e08696780b5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.1/stack-2.9.1-linux-x86_64-static.tar.gz",
                            "dlHash": "cd8ef4a844f141159189899a128a33f4beb9ec4e66ac96fc2ada47a626a9d462",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.1/stack-2.9.1-linux-i386.tar.gz",
                            "dlHash": "2032795cea9b814a68e65e5ab2d079c4beed877aa366f966a1984c6ad2bbfba2",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.1/stack-2.9.1-linux-i386.tar.gz",
                            "dlHash": "2032795cea9b814a68e65e5ab2d079c4beed877aa366f966a1984c6ad2bbfba2",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.1/stack-2.9.1-linux-aarch64.tar.gz",
                            "dlHash": "bd9704ff22bceb8de8635e392ab19f49aaa56929be15e1ccbfc511b555164219",
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.1/stack-2.9.1-osx-aarch64.tar.gz",
                            "dlHash": "632d51877a86235d4300c254e85353166def5b71b394e5db56c25cdf9dee6e98",
                        },
                    },
                },
                "A_ARM": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.1/stack-2.9.1-linux-armv7.tar.gz",
                            "dlHash": "fa53c58d8d00a6d49ec26624aa7f817f5ece3c4df339fa6e4fccf1038b7f1fa5",
                        },
                    },
                },
            },
        },
        "2.9.3": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v293",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.3/stack-2.9.3-linux-x86_64-static.tar.gz",
                            "dlHash": "b1cc32d772456b6ee7aefdd606c25c341670400cec577f8966365f962f883ec5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.3/stack-2.9.3-osx-x86_64.tar.gz",
                            "dlHash": "34b74a0e764cd7363255005158984be11faa392871acc6b5af3238ac444a2806",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.3/stack-2.9.3-windows-x86_64.tar.gz",
                            "dlHash": "816be0ce817f74c18074b1a496b4ac9ea0b22b7745d9a7bf77c19161e251e8ad",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.3/stack-2.9.3-freebsd-x86_64.tar.xz",
                            "dlHash": "b1184820aa42f15188c2dc14d4566195f9ecc71f191dde7643caff84e027a80b",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.3/stack-2.9.3-linux-x86_64-static.tar.gz",
                            "dlHash": "b1cc32d772456b6ee7aefdd606c25c341670400cec577f8966365f962f883ec5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_32": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.3/stack-2.9.3-linux-i386.tar.gz",
                            "dlHash": "89f7237a326f0644319289ff86320a99c1c0c631cb0a12667a4f22f10cc1cec7",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.3/stack-2.9.3-linux-i386.tar.gz",
                            "dlHash": "89f7237a326f0644319289ff86320a99c1c0c631cb0a12667a4f22f10cc1cec7",
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.3/stack-2.9.3-linux-aarch64.tar.gz",
                            "dlHash": "161e1638da9efc56319f7225b3652ca3f339bcda9eadc7d6ce512f325b0f014a",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.9.3/stack-2.9.3-linux-aarch64.tar.gz",
                            "dlHash": "161e1638da9efc56319f7225b3652ca3f339bcda9eadc7d6ce512f325b0f014a",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.9.3/stack-2.9.3-osx-aarch64.tar.gz",
                            "dlHash": "a56d2cd37611eccf00ab8df38c3718923cf5677f3aeacd250394e79b676dcb98",
                        },
                    },
                },
            },
        },
        "2.11.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v2111---2023-05-18",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-linux-x86_64.tar.gz",
                            "dlHash": "408a120e824ed6e6b24c548a2ff6f210fcb0eed246f204a280ed4c75af0517e7",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-osx-x86_64.tar.gz",
                            "dlHash": "cf3ce4c526fb29fabf84308a8a762f7ab703975f5c9eeb85aebcea97a02540fc",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-windows-x86_64.tar.gz",
                            "dlHash": "74938b6f53aa5cfdece0d3a687675c30d2ae38798c38f81d394195b8db87cdc7",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.11.1/stack-2.11.1-freebsd-x86_64.tar.xz",
                            "dlHash": "ab56bd078f78f9fce458cbefba48cfc5bc965704b74aefc34988036dfafa0937",
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-linux-x86_64.tar.gz",
                            "dlHash": "408a120e824ed6e6b24c548a2ff6f210fcb0eed246f204a280ed4c75af0517e7",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-linux-aarch64.tar.gz",
                            "dlHash": "c7733d07ed78d6f4d82e0ebf6d260eb693c6c9df2208003d60caba69766f9c15",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-linux-aarch64.tar.gz",
                            "dlHash": "c7733d07ed78d6f4d82e0ebf6d260eb693c6c9df2208003d60caba69766f9c15",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.11.1/stack-2.11.1-osx-aarch64.tar.gz",
                            "dlHash": "3ea56c5885c9c6d7e2dce927e44f48f6024a4a5a039f7acad79b19654a6f95b5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.13.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v2131---2023-09-29",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-linux-x86_64.tar.gz",
                            "dlHash": "45281bb2385e928916ec8bcbc7ab790ce8721bbf805f3d0752544ada22ad5ea3",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-osx-x86_64.tar.gz",
                            "dlHash": "b7d46382edb17230d21943844550d3aaeacee8b6fb1fcc7980ca59bee500b2a5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-windows-x86_64.tar.gz",
                            "dlHash": "728be2371e257c6960341167192fa704ff1f92ab61657dd4781710a257fae7c1",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.13.1/stack-2.13.1-freebsd-x86_64.tar.xz",
                            "dlHash": "3a1a026d747d8f4858fc83080143acc10dbd7a40a766848bebeb401fde5afd4c",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-linux-x86_64.tar.gz",
                            "dlHash": "45281bb2385e928916ec8bcbc7ab790ce8721bbf805f3d0752544ada22ad5ea3",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-linux-aarch64.tar.gz",
                            "dlHash": "37b1dbf39131eea629a6e3685fd1153fdfd2f0cd2179db92bb33784987b4ddb8",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-osx-aarch64.tar.gz",
                            "dlHash": "18ececd7112b1aad01ab0f88cb68ae63f2dc74aa9b8b5319828979f43cba9907",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://github.com/commercialhaskell/stack/releases/download/v2.13.1/stack-2.13.1-linux-aarch64.tar.gz",
                            "dlHash": "37b1dbf39131eea629a6e3685fd1153fdfd2f0cd2179db92bb33784987b4ddb8",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.15.1": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v2151---2024-02-09",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-linux-x86_64.tar.gz",
                            "dlHash": "f024f8f864a0c1100fdce3c0935ce86d1f1b8bbdeb9e5fe0e744f75a9b85eede",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-osx-x86_64.tar.gz",
                            "dlHash": "f579d9ba176a0aefc6d8dda1672ae3be0ddf78a8982fb1a2112ee96fb3d551f5",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-windows-x86_64.tar.gz",
                            "dlHash": "14b9e5cdc5fcd035288d0a28c8183f23d22d48bde1193781517906a994e66e54",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-freebsd-x86_64.tar.gz",
                            "dlHash": "7de6742f8298003af895133a5b41895f02a4dcd52bb0f175c49e4af09f94da75",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-linux-x86_64.tar.gz",
                            "dlHash": "f024f8f864a0c1100fdce3c0935ce86d1f1b8bbdeb9e5fe0e744f75a9b85eede",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-linux-aarch64.tar.gz",
                            "dlHash": "57f3eb7c28275c53b12e5be7a94af280ab38392db5772379066e88fb114ff041",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-osx-aarch64.tar.gz",
                            "dlHash": "3644a3825124c7275c1e77c609c4ad96f1175083750fea2665c438c5a093c1ec",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.1/stack-2.15.1-linux-aarch64.tar.gz",
                            "dlHash": "57f3eb7c28275c53b12e5be7a94af280ab38392db5772379066e88fb114ff041",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.15.3": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v2153---2024-03-07",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-linux-x86_64.tar.gz",
                            "dlHash": "a5ee1fdf6a36f749df88dfd552dd0defb8d29c15548400fb937fc536a0033bc6",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-osx-x86_64.tar.gz",
                            "dlHash": "ba6f63bea27d2d87f887bb0376a5984b0610b052ac5886b3bb3ca5cbf0fa994f",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-windows-x86_64.tar.gz",
                            "dlHash": "d0011cd343365b856b012bd6d94346d6b77b901927462d701a4b401f1402b08e",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-freebsd-x86_64.tar.gz",
                            "dlHash": "03808912ade4e256693a118aee6fd77aa98358f2e771a230726a756271dff8d2",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-linux-x86_64.tar.gz",
                            "dlHash": "a5ee1fdf6a36f749df88dfd552dd0defb8d29c15548400fb937fc536a0033bc6",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-linux-aarch64.tar.gz",
                            "dlHash": "ce7e2dab7fff39071e43825d577f721f42d25376b31155f981b52623dd1a4983",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-osx-aarch64.tar.gz",
                            "dlHash": "70403629a22f5f4c9b3b87385b3d31a8a035598ec84c81f3c9326d762da04a17",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.3/stack-2.15.3-linux-aarch64.tar.gz",
                            "dlHash": "ce7e2dab7fff39071e43825d577f721f42d25376b31155f981b52623dd1a4983",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.15.5": {
            "viTags": [
                "old",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v2155---2024-03-28",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-linux-x86_64.tar.gz",
                            "dlHash": "93b604aa47ca50be8d3ab1e88fa400784ca10215dc0ad8f24124415e890f4e8c",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-osx-x86_64.tar.gz",
                            "dlHash": "d13416b6874532f5d0a6ba16b691ba85f380c9b135505d6769130e015582d83b",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-windows-x86_64.tar.gz",
                            "dlHash": "eccea30d7ce8e4be54d9e37b9d5b7866de1881e10f9e298b9f63eeea6d5013d4",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-freebsd-x86_64.tar.gz",
                            "dlHash": "3f115cd5a415e944c02b0506b3fbc85c238dcd514d3ce135b37c3e0dacaf5251",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-linux-x86_64.tar.gz",
                            "dlHash": "93b604aa47ca50be8d3ab1e88fa400784ca10215dc0ad8f24124415e890f4e8c",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-linux-aarch64.tar.gz",
                            "dlHash": "92aaa25efd1e66b354790457451fd4872b583ba82c28bc0f79aafdfddc2f1f80",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-osx-aarch64.tar.gz",
                            "dlHash": "275dea9983b298b421a49aa89cac707375112d7e5e7f9a793e6ff0427c02c36b",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-linux-aarch64.tar.gz",
                            "dlHash": "92aaa25efd1e66b354790457451fd4872b583ba82c28bc0f79aafdfddc2f1f80",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "2.15.7": {
            "viTags": [],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v2157---2024-05-12",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-linux-x86_64.tar.gz",
                            "dlHash": "74a301f61135caf400680a718048bf4d985a3c28e9266b78a54117349f4c27d8",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-osx-x86_64.tar.gz",
                            "dlHash": "0d1b70babf342b61d844a8e8f0e4101f6f6b30096a0ea6a55718174b1568f19f",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-windows-x86_64.tar.gz",
                            "dlHash": "fa7e2f81117a79c2fe79e014cc83595babb5d6d4288bf68e197af14988a4a2e4",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-freebsd-x86_64.tar.gz",
                            "dlHash": "b03b5965a4637217699e5257d0d5c4c4e5a67e3eb9745d22b58a4ba0d84bf294",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-linux-x86_64.tar.gz",
                            "dlHash": "74a301f61135caf400680a718048bf4d985a3c28e9266b78a54117349f4c27d8",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-linux-aarch64.tar.gz",
                            "dlHash": "fb15835bc985d3ddb64db9d968bff519e40be5c15d3c75009bb6fab5a3e89bff",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-osx-aarch64.tar.gz",
                            "dlHash": "d46149e7f26c5ca53d60fc51a0928e4ccb0561ea380070942b689af0a842f766",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.7/stack-2.15.7-linux-aarch64.tar.gz",
                            "dlHash": "fb15835bc985d3ddb64db9d968bff519e40be5c15d3c75009bb6fab5a3e89bff",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "3.1.1": {
            "viTags": [],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v311---2024-07-28",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-linux-x86_64.tar.gz",
                            "dlHash": "c3eb44b487c7a5044237ae880d55dda2f0a98086c5f0d3b16829384820acaa62",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-osx-x86_64.tar.gz",
                            "dlHash": "41e797d0296b44be94330b52bddadc68dfc4b257958125f12201757bc6281bc3",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-windows-x86_64.tar.gz",
                            "dlHash": "fc1b79bf88a89b42be741bcb7f88c63b97e625a4e3f4f505281df3369a69da3d",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-freebsd-x86_64.tar.gz",
                            "dlHash": "d344579730d8984fa60d0b00df0ab6b61c534fee6d0423d6d024a376ab991551",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-linux-x86_64.tar.gz",
                            "dlHash": "c3eb44b487c7a5044237ae880d55dda2f0a98086c5f0d3b16829384820acaa62",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-linux-aarch64.tar.gz",
                            "dlHash": "6ad3ceb1b5a0d6cfd3b2bc16dd4c422658c39a6bd23586f4902fcb5e7f9085b4",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-linux-aarch64.tar.gz",
                            "dlHash": "6ad3ceb1b5a0d6cfd3b2bc16dd4c422658c39a6bd23586f4902fcb5e7f9085b4",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.1.1/stack-3.1.1-osx-aarch64.tar.gz",
                            "dlHash": "25bdc530667f9e35808b1f3276addff7e8544695956497311d4cf3ce7242c8e6",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
        "3.3.1": {
            "viTags": [
                "Latest",
                "Recommended",
            ],
            "viChangeLog": "https://github.com/commercialhaskell/stack/blob/master/ChangeLog.md#v331---2024-12-28",
            "viPostInstall": "Stack manages GHC versions internally by default. To improve integration, please visit:\n  https://www.haskell.org/ghcup/guide/#stack-integration\n\nAlso check out:\n  https://docs.haskellstack.org/en/stable/yaml_configuration\n",
            "viArch": {
                "A_64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-linux-x86_64.tar.gz",
                            "dlHash": "6c03ce25dd074b3323ea4bbe8992502355eb12981b7170be981f238721633c39",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-osx-x86_64.tar.gz",
                            "dlHash": "a1230c9a54d6fe985256b9eb47382d7136f04eb338d537187a4d640c14254b93",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Windows": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-windows-x86_64.tar.gz",
                            "dlHash": "3f5f1b786df5a54cbee62585ec867563c6b9be7bdbbed6a8b11e92c1f8059931",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "FreeBSD": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-freebsd-x86_64.tar.gz",
                            "dlHash": "26b8804d295ba00f23fe78d4a7957a64d4eb9ea5964f32ea5c4820b75eab12d6",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-linux-x86_64.tar.gz",
                            "dlHash": "6c03ce25dd074b3323ea4bbe8992502355eb12981b7170be981f238721633c39",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
                "A_ARM64": {
                    "Linux_UnknownLinux": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-linux-aarch64.tar.gz",
                            "dlHash": "c4653cc5f9d51f896a363d59bbf85117ac42b5e25642534f5bc5103b47dd1862",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Linux_Alpine": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-linux-aarch64.tar.gz",
                            "dlHash": "c4653cc5f9d51f896a363d59bbf85117ac42b5e25642534f5bc5103b47dd1862",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                    "Darwin": {
                        "unknown_versioning": {
                            "dlUri": "https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/3.3.1/stack-3.3.1-osx-aarch64.tar.gz",
                            "dlHash": "e03fbf29c838d2c3bc6d13738bb8de2dab1ceefafbd8e5574674022bb9b02fa2",
                            "dlSubdir": {
                                "RegexDir": "stack-.*",
                            },
                        },
                    },
                },
            },
        },
    },
}
