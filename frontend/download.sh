RELEASE_IPFS_CID=$1
IPFS_GATEWAY=${IPFS_GATEWAY_URL:-https://ipfs.io}
echo "Detected IPFS CID \"$RELEASE_IPFS_CID\""

mkdir /deps/temp
mkdir /app

curl --output /deps/temp/frontend.tar "$IPFS_GATEWAY/ipfs/$RELEASE_IPFS_CID?download=true&format=tar&filename=frontend.tar"
tar -xvf /deps/temp/frontend.tar

cp -r /deps/$RELEASE_IPFS_CID/. /app
rm -r /deps/temp