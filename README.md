# AutoMod README

AutoMod language support for VS Code.

(Primary for internal use. Developed during master's thesis)

## Features
* Comment blocks
* Syntax highlighting
* Snippets
* Auto-completion (AutoMod reserved keywords)
* Generator scripts (Snippets, keywords)
* CodeMap (outliner/mapper)

Syntax highlight.

![Alt text](https://github.com/yulihGit/vscode-automod/blob/master/resources/images/readme/vsce_automod_syntax.PNG?raw=true "Title")

Snippets (procedure, subroutine, functions, methods, other examples).

![Alt text](https://github.com/yulihGit/vscode-automod/blob/master/resources/images/readme/vsce_automod_snippets.PNG?raw=true "Title")

Auto-completion (AutoMod reserved keywords)

![Alt text](https://github.com/yulihGit/vscode-automod/blob/master/resources/images/readme/vsce_automod_keywords.PNG?raw=true "Title")

Generate paste-ready snippets from plain AutoMod code. Paste and configure generated .json inside snippet management file.

**SnippetBody_Input.asy** -> **python script** -> **SnippetBody_Output.json** -> paste & configure in **automod.json**

Requires installation of [Python](https://www.python.org/) and [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner
) extension.

![Alt text](https://github.com/yulihGit/vscode-automod/blob/master/resources/images/readme/vsce_automod_snippet_generate.gif?raw=true "Title")

CodeMap for AutoMod. Requires installation of [CodeMap](https://marketplace.visualstudio.com/items?itemName=oleg-shilo.codemap) extension.

![Alt text](https://github.com/yulihGit/vscode-automod/blob/master/resources/images/readme/vsce_automod_codemap.gif?raw=true "Title")

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Known Issues

 ...

## Release Notes

### 0.0.1
Initial release of AutoMod language support for VS Code
### 0.0.2
Clean up
### 0.0.3
Added .gif for snippet generation in readme

## Credits
* [vscode-docs on GitHub](https://code.visualstudio.com/docs)
* [markdown-docs on GitHub](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Links

* [AutoMod Integration tutorial (deprecated)](https://sites.google.com/view/automod-vscode/home)

**Enjoy!**