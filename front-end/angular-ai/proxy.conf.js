//AQUI É O SEGREDO DA CONEXÃO COM O BACK-END

const PROXY_CONFIG = [
  {
    context: ["/api"], //tudo oque for (/API )   redireciona para o localhost:8080
    target: "http://localhost:8080",
    secure: false, //NAO TEM HTTPS POR ISSO O FALSE
    changeOrigin: true, //ALTERAÇÃO DE IA
    logLevel: "debug",
  },
];

module.exports = PROXY_CONFIG;

