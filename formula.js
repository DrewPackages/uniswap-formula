const paramsSchema = {
  properties: {
    version: {
      type: "string",
    },
    port: {
      type: "string",
    },
  },
};

function deploy(params) {
  api.offchain.deploy({
    details: {
      envs: {
        UNISWAP_WEB_VERSION: params?.version || "web/5.40.3",
        PORT: params?.port || "8080",
        DOCKER_COMPOSE_PROJECT_NAME: "drew-uniswap",
      },
      flags: {
        build: true,
      },
    },
  });
}
