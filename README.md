# dotfiles

## target

### zsh

### vim

### git

* 以下のコマンドで設定を確認できる
  ```bash
  $ git config -l
  ```
* ignore関係
  * globalなignoreな設定は `~/.config/git/ignore` がデフォルト値となっている
    * 参考：[Zenn - ~/.gitignore_global を指定するのをやめ、デフォルトの置き場に置こう]( https://zenn.dev/qnighy/articles/1a756f2857dc20 )
  * ignoreの設定自体は https://github.com/github/gitignore が参考になる

### vscode

* `.vscode/settings.json` に標準的な設定項目が記載されてる
  * こいつをユーザー設定とするには `make code/usersettings/install` をやる
  * https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations
* `vscode-extensions.txt` によく使っているextensionが入っている

## Usage

* 以下のコマンドで適宜シンボリックリンクを貼れる
  ```bash
  $ make dotfiles/install
  ```
* vscodeのextensionは以下のコマンドでinstallできる
  ```bash
  $ make code/extension/install
  ```

## References

* blog
  * [Qiita - ようこそdotfilesの世界へ]( https://qiita.com/yutkat/items/c6c7584d9795799ee164 )
  * [Zenn - GitHubでスター数の多いdotfilesを使ってみた]( https://zenn.dev/yutakatay/articles/try-dotfiles-01 )
  * [dotfilesと連携するMacの環境構築ブートストラップスクリプトをAnsibleで書いた。]( https://senyoltw.hatenablog.jp/entry/2020/06/12/190152 )
* 他の人のdotfiles
  * https://github.com/yutkat/dotfiles
  * https://github.com/bitwalker/dotfiles
  * https://github.com/jessfraz/dotfiles