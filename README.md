# dotfiles

## target

### zsh

### vim

### git

以下のコマンドで設定を確認できる
```bash
$ git config -l
```

### vscode

* `.vscode/settings.json` に標準的な設定項目が記載されてる
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