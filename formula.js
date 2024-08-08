const paramsSchema = {
  properties: {
    version: {
      type: "string",
    },
  },
};

function deploy(params) {
  api.offchain.deploy({
    details: {
      envs: {
        UNISWAP_WEB_VERSION: params?.version || "web/5.40.3",
      },
      flags: {
        build: true,
      },
    },
  });
}
