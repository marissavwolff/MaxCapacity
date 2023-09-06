# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "asana", to: "https://ga.jspm.io/npm:asana@2.0.3/dist/index.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/buffer.js"
pin "component-emitter", to: "https://ga.jspm.io/npm:component-emitter@1.3.0/index.js"
pin "fast-safe-stringify", to: "https://ga.jspm.io/npm:fast-safe-stringify@2.1.1/index.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/fs.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
pin "querystring", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/querystring.js"
pin "superagent", to: "https://ga.jspm.io/npm:superagent@5.3.1/lib/client.js"
