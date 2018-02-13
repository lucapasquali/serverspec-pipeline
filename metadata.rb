require 'yahoo/cookbook_version_helper'

name 'pdi-pipeline'
maintainer 'lucap'
maintainer_email 'lucap@yahoo-inc.com'
license 'Copyright 2017 Yahoo Inc. All rights reserved.'
description 'pipeline for pdi cluster'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version Yahoo::CookbookVersionHelper.cookbook_version

source_url 'https://git.corp.yahoo.com/lucap/pdi-pipeline'
issues_url 'https://git.corp.yahoo.com/lucap/pdi-pipeline/issues'
