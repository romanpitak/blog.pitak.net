# Redirect builder

This script builds redirection files from my old blog
`blog.pitak.net` hosted on GitHub,
to my new blog `pitak.net/blog`.

Takes 3 parameters:

- Yaml configuration file
- Jade redirect page template
- output directory name

load modules

    {readFileSync, writeFileSync} = require 'fs'
    {safeLoad} = require 'js-yaml'
    {compile} = require 'jade'
    mkdirp = require 'mkdirp'

load redirect index

    render = compile readFileSync process.argv[3], 'utf8'

load config

    {targetBaseUrl, sites} = safeLoad readFileSync process.argv[2], 'utf8'

parse config

    for site in sites
        targetDir = "#{process.argv[4]}#{site.from}"
        mkdirp.sync targetDir
        writeFileSync "#{targetDir}index.html", render
            targetUrl: "#{targetBaseUrl}#{site.to}"
