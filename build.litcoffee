# Redirect builder

This script builds redirection files from my old blog
`blog.pitak.net` hosted on GitHub,
to my new blog `pitak.net/blog`.

Takes 2 parameters:

- Yaml configuration file
- output directory name

load modules

    {readFileSync, writeFileSync} = require 'fs'
    {safeLoad} = require 'js-yaml'
    mkdirp = require 'mkdirp'

load config

    {targetBaseUrl, sites} = safeLoad readFileSync process.argv[2], 'utf8'

parse config

    for site in sites
        targetDir = "#{process.argv[3]}#{site.from}"
        mkdirp.sync targetDir
        content = "<?php\n"
        content += "header(\"HTTP/1.1 301 Moved Permanently\");\n"
        content += "header(\"Location: #{targetBaseUrl}#{site.to}\");\n"
        writeFileSync "#{targetDir}index.php", content
