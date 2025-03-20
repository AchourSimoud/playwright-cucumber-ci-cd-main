module.exports = {
  default: {
    require: [
      "step-definitions/**/*.ts",   // Path to step definitions
      "hooks/**/*.ts"               // Path to hooks
    ],
    format: [
      "allure-cucumberjs/reporter",      // Pour les rapports Allure
      "progress",                           // Affiche la progression dans le terminal
      "json:reports/cucumber-report.json",   // JSON report pour Allure
      "html:reports/cucumber-report.html"    // HTML report pour la lecture humaine
    ],
    tags: process.env.TAGS || "",  
    worldParameters: {
      env1Url: "https://django-site-info-integration.onrender.com/admin",
      env2Url: "https://django-site-info-integration.onrender.com/admin"
      //env1Url: "http://int.siteinfos.com/admin/login/?next=/admin/",
      //env2Url: "http://rec.siteinfos.com/admin/login/?next=/admin/"
    },
    requireModule: ["ts-node/register"],     // Activer TypeScript
    timeout: 10000                           // Temps d'exécution max (10s)
  },
};
