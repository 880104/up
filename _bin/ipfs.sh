#!/bin/bash -x

gitDir=$(realpath . || exit 1)

selfFile=$(realpath ${BASH_SOURCE[0]} || exit 1)
selfDir=$(dirname $selfFile || exit 1)

cd $selfDir || exit 1

tmpDir=$(mktemp -d || exit 2)
unxz -k ipfs.xz || exit 2
mv ./ipfs "$tmpDir" || exit 2

cd $tmpDir || exit 2
chmod +x ./ipfs || exit 2
ipfs=$(realpath ./ipfs || exit 2)

$ipfs init || exit 3

ipfsg() {
  local tmpdir=$(mktemp -d || return 1)
  cd $tmpdir || return 1

  local qm="$1"
  local dst="$2"

  $ipfs get "$qm" || return 2
  
  mv ./$qm "$dst" || return 3

  return 0
}

ipfsg QmaoLoRFPaiX9yqUR3D4yUuDpkxNhabsTm5Nqar8MUvhLv "$gitDir"/monero-2022-04/

exit 0
