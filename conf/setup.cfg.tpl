#!/usr/bin/perl
#
# Setup file for ikiwiki.
# 
# Passing this to ikiwiki --setup will make ikiwiki generate
# wrappers and build the wiki.
# 
# Remember to re-run ikiwiki --setup any time you edit this file.
use IkiWiki::Setup::Standard {
	# name of the wiki
	wikiname => '{{ env["IKIWIKI_NAME"] }}',
	# contact email for wiki
	adminemail => '{{ env["IKIWIKI_ADMIN_EMAIL"] }}',
	# users who are wiki admins
	adminuser => [qw{ {{ env["IKIWIKI_ADMIN_USER"] }} }],
	# users who are banned from the wiki
	banned_users => [],
	# where the source of the wiki is located
	srcdir => '{{ env["IKIWIKI_HOME"] }}/www.checkout',
	# where to build the wiki
	destdir => '/app',
	# base url to the wiki
	url => '{{ env["IKIWIKI_URL"] }}',
	# url to the ikiwiki.cgi
	cgiurl => '{{ env["IKIWIKI_URL"] }}/ikiwiki.cgi',
	# filename of cgi wrapper to generate
	cgi_wrapper => '/app/cgi-bin/ikiwiki.cgi',
	# mode for cgi_wrapper (can safely be made suid)
	cgi_wrappermode => '0755',
	# rcs backend to use
	rcs => 'git',
	# plugins to add to the default configuration
	add_plugins => [qw{shortcut goodstuff websetup search attachment format highlight graphviz blogspam calendar opendiscussion sidebar comments moderatedcomments bibtex}],
	# plugins to disable
	disable_plugins => [qw{openid flickr google}],
	# additional directory to search for template files
	templatedir => '/usr/share/ikiwiki/templates',
	# base wiki source location
	underlaydir => '/usr/share/ikiwiki/basewiki',
	# display verbose messages?
	#verbose => 1,
	# log to syslog?
	syslog => 1,
	# create output files named page/index.html?
	usedirs => 1,
	# use '!'-prefixed preprocessor directives?
	prefix_directives => 1,
	# use page/index.mdwn source files
	indexpages => 0,
	# enable Discussion pages?
	discussion => 0,
	# name of Discussion pages
	discussionpage => 'Diskussion',
	# generate HTML5? (experimental)
	html5 => 0,
	# only send cookies over SSL connections?
	sslcookie => 0,
	# extension to use for new pages
	default_pageext => 'mdwn',
	# extension to use for html files
	htmlext => 'html',
	# strftime format string to display date
	timeformat => '%c',
	# UTF-8 locale to use
	#locale => 'en_US.UTF-8',
	# put user pages below specified page
	userdir => '',
	# how many backlinks to show before hiding excess (0 to show all)
	numbacklinks => 10,
	# attempt to hardlink source files? (optimisation for large files)
	hardlink => 0,
	# force ikiwiki to use a particular umask
	#umask => 022,
	# group for wrappers to run in
	#wrappergroup => 'ikiwiki',
	# extra library and plugin directory
	libdir => '{{ env["IKIWIKI_HOME"] }}/.ikiwiki',
	# environment variables
	ENV => {},
	# regexp of normally excluded files to include
	include => '\\.htaccess$',
	# regexp of files that should be skipped
	#exclude => '^(*\\.private|Makefile)$',
	# specifies the characters that are allowed in source filenames
	wiki_file_chars => '-[:alnum:]+/.:_',
	# allow symlinks in the path leading to the srcdir (potentially insecure)
	allow_symlinks_before_srcdir => 0,

	######################################################################
	# core plugins
	#   (editpage, git, htmlscrubber, inline, link, meta, parentlinks)
	######################################################################

	# git plugin
	# git hook to generate
	# git_wrapper => '{{ env["IKIWIKI_HOME"] }}/www.git/hooks/post-update',
	# shell command for git_wrapper to run, in the background
	#git_wrapper_background_command => 'git push github',
	# mode for git_wrapper (can safely be made suid)
	#git_wrappermode => '06755',
	# git pre-receive hook to generate
	#git_test_receive_wrapper => '/git/wiki.git/hooks/pre-receive',
	# unix users whose commits should be checked by the pre-receive hook
	#untrusted_committers => [],
	# gitweb url to show file history ([[file]] substituted)
	#historyurl => 'http://git.example.com/gitweb.cgi?p=wiki.git;a=history;f=[[file]];hb=HEAD',
	# gitweb url to show a diff ([[file]], [[sha1_to]], [[sha1_from]], [[sha1_commit]], and [[sha1_parent]] substituted)
	#diffurl => 'http://git.example.com/gitweb.cgi?p=wiki.git;a=blobdiff;f=[[file]];h=[[sha1_to]];hp=[[sha1_from]];hb=[[sha1_commit]];hpb=[[sha1_parent]]',
	# where to pull and push changes (set to empty string to disable)
	gitorigin_branch => 'origin',
	# branch that the wiki is stored in
	gitmaster_branch => 'master',

	# htmlscrubber plugin
	# PageSpec specifying pages not to scrub
	#htmlscrubber_skip => '!*/Discussion',

	# inline plugin
	# enable rss feeds by default?
	rss => 1,
	# enable atom feeds by default?
	atom => 1,
	# allow rss feeds to be used?
	#allowrss => 0,
	# allow atom feeds to be used?
	#allowatom => 0,
	# urls to ping (using XML-RPC) on feed update
	#pingurl => 'http://rpc.technorati.com/rpc/ping',

	######################################################################
	# auth plugins
	#   (anonok, blogspam, httpauth, lockedit, moderatedcomments,
	#    opendiscussion, openid, passwordauth, signinedit)
	######################################################################

	# anonok plugin
	# PageSpec to limit which pages anonymous users can edit
	#anonok_pagespec => '*/discussion',

	# blogspam plugin
	# PageSpec of pages to check for spam
	#blogspam_pagespec => 'postcomment(*)',
	# options to send to blogspam server
	blogspam_options => 'whitelist=2001:a60:f000:81a9:fc9e:830f:7678:73a0,2001::/112',
	# blogspam server XML-RPC url
	#blogspam_server => '',

	# httpauth plugin
	# url to redirect to when authentication is needed
	#cgiauthurl => 'http://example.com/wiki/auth/ikiwiki.cgi',
	# PageSpec of pages where only httpauth will be used for authentication
	#httpauth_pagespec => '!*/Discussion',

	# lockedit plugin
	# PageSpec controlling which pages are locked
	#locked_pages => '!*/Discussion',

	# moderatedcomments plugin
# PageSpec matching users or comment locations to moderate
moderate_pagespec => '*',

	# openid plugin
	# url pattern of openid realm (default is cgiurl)
	#openid_realm => '',
	# url to ikiwiki cgi to use for openid authentication (default is cgiurl)
	#openid_cgiurl => '',

	# passwordauth plugin
	# a password that must be entered when signing up for an account
	account_creation_password => '{{ env["IKIWIKI_ACCOUNT_CREATION_PASSWORD"] }}',
	# cost of generating a password using Authen::Passphrase::BlowfishCrypt
	#password_cost => 8,

	######################################################################
	# format plugins
	#   (creole, highlight, hnb, html, mdwn, otl, rawhtml, textile, txt)
	######################################################################

	# highlight plugin
	# types of source files to syntax highlight
	#tohighlight => '.c .h .cpp .pl .py Makefile:make',

	# mdwn plugin
	# enable multimarkdown features?
	multimarkdown => 1,

	######################################################################
	# misc plugins
	#   (filecheck)
	######################################################################

	######################################################################
	# web plugins
	#   (404, attachment, comments, editdiff, edittemplate, getsource,
	#    google, goto, mirrorlist, remove, rename, repolist, search,
	#    theme, websetup, wmd)
	######################################################################

	# attachment plugin
	# enhanced PageSpec specifying what attachments are allowed
	#allowed_attachments => 'virusfree() and mimetype(image/*) and maxsize(50kb)',
	# virus checker program (reads STDIN, returns nonzero if virus found)
	#virus_checker => 'clamdscan -',

	# comments plugin
	# PageSpec of pages where comments are allowed
	comments_pagespec => 'posts/* and !*/diskussion',
	# PageSpec of pages where posting new comments is not allowed
	#comments_closed_pagespec => 'blog/controversial or blog/flamewar',
	# Base name for comments, e.g. "comment_" for pages like "sandbox/comment_12"
	#comments_pagename => '',
	# Interpret directives in comments?
	#comments_allowdirectives => 0,
	# Allow anonymous commenters to set an author name?
	#comments_allowauthor => 0,
	# commit comments to the VCS
	#comments_commit => 1,

	# getsource plugin
	# Mime type for returned source.
	#getsource_mimetype => 'text/plain; charset=utf-8',

	# mirrorlist plugin
	# list of mirrors
	#mirrorlist => {},

	# repolist plugin
	# URIs of repositories containing the wiki's source
	#repositories => [qw{svn://svn.example.org/wiki/trunk}],

	# search plugin
	# path to the omega cgi program
	#omega_cgi => '/usr/lib/cgi-bin/omega/omega',

	# theme plugin
	# name of theme to enable
	#theme => 'actiontabs',

	# websetup plugin
	# list of plugins that cannot be enabled/disabled via the web interface
	#websetup_force_plugins => [],
	# list of additional setup field keys to treat as unsafe
	#websetup_unsafe => [],
	# show unsafe settings, read-only, in web interface?
	#websetup_show_unsafe => 1,

	######################################################################
	# widget plugins
	#   (calendar, color, conditional, cutpaste, date, format, fortune,
	#    graphviz, haiku, img, linkmap, listdirectives, map, more,
	#    orphans, pagecount, pagestats, poll, polygen, postsparkline,
	#    progress, shortcut, sparkline, table, template, teximg, toc,
	#    toggle, version)
	######################################################################

	# calendar plugin
	# base of the archives hierarchy
	#archivebase => 'archives',
	# PageSpec of pages to include in the archives; used by ikiwiki-calendar command
	#archive_pagespec => 'page(posts/*) and !*/Discussion',

	# listdirectives plugin
	# directory in srcdir that contains directive descriptions
	#directive_description_dir => 'ikiwiki/directive',

	# teximg plugin
	# Should teximg use dvipng to render, or dvips and convert?
	#teximg_dvipng => '',
	# LaTeX prefix for teximg plugin
	#teximg_prefix => '\\documentclass{article}
	#\\usepackage{amsmath}
	#\\usepackage{amsfonts}
	#\\usepackage{amssymb}
	#\\pagestyle{empty}
	#\\begin{document}
	#',
	# LaTeX postfix for teximg plugin
	#teximg_postfix => '\\end{document}',

	######################################################################
	# other plugins
	#   (aggregate, autoindex, brokenlinks, camelcase, ddate, embed,
	#    favicon, goodstuff, htmlbalance, localstyle, pagetemplate,
	#    pingee, pinger, prettydate, recentchanges, recentchangesdiff,
	#    relativedate, rsync, sidebar, smiley, sortnaturally, tag,
	#    testpagespec, underlay)
	######################################################################

	# aggregate plugin
	# enable aggregation to internal pages?
	#aggregateinternal => 1,
	# allow aggregation to be triggered via the web?
	#aggregate_webtrigger => 0,

	# camelcase plugin
	# list of words to not turn into links
	#camelcase_ignore => [],

	# pinger plugin
	# how many seconds to try pinging before timing out
	#pinger_timeout => 15,

	# prettydate plugin
	# format to use to display date
	#prettydateformat => '%X, %B %o, %Y',

	# recentchanges plugin
	# name of the recentchanges page
	#recentchangespage => 'recentchanges',
	# number of changes to track
	#recentchangesnum => 100,

	# rsync plugin
	# command to run to sync updated pages
	#rsync_command => 'rsync -qa --delete . user@host:/path/to/docroot/',

	# sidebar plugin
	# show sidebar page on all pages?
	global_sidebars => 1,

	# tag plugin
	# parent page tags are located under
	tagbase => 'tag',
	# autocreate new tag pages?
	#tag_autocreate => 1,

	# underlay plugin
	# extra underlay directories to add
	#add_underlays => [qw{/home/stettberger/wiki.underlay}],
}
