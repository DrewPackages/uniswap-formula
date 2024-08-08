VERSION=${UNISWAP_WEB_VERSION:-web/5.40.3}

ENCODED_TAG=$(jq -rn --arg x $VERSION '$x|@uri')

RELEASE_BODY=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/Uniswap/interface/releases/tags/$ENCODED_TAG | jq ".body")

RELEASE_IPFS_CID=$(echo $RELEASE_BODY | gawk 'match($0, /ipfs:\/\/(.*)\/]/, ary) {print ary[1]; }')
echo "Detected IPFS CID \"$RELEASE_IPFS_CID\""
echo $RELEASE_IPFS_CID > cid