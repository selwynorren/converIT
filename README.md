<div align="center">
    <h1>
        <img width="64" height="64" src="https://github.com/selwynorren/converIT/blob/master/data/images/com.github.selwynorren.converIT.png" alt="Icon">converIT</h1>
  <h3 align="center">A multimedia file converter based on the brilliant Ciano.</h3>
</div>

<p align="center">
    <img src="https://github.com/selwynorren/converIT/blob/master/data/images/screenshots.png" alt="Screenshot">
</p>

<div class="center">
  <h1 align="center">Information</h1>
</div>


### Description

Convert videos, music and pictures with the best possible experience.

### Links

- [Website](https://selwynorren.github.io/converIT)
- [Report a problem](https://github.com/selwynorren/converIT/issues/new?template=bug_report.md)
- [Feature request](https://github.com/selwynorren/converIT/issues/new?template=feature_request.md)

### Installation

#### Hit the button to get Ciano!

On elementary OS?

[![Get it on AppCenter](https://appcenter.elementary.io/badge.svg)](https://appcenter.elementary.io/com.github.selwynorren.convertIT) (This will be live in due course)

On debian, ubuntu and derivatives

[![Get the .Deb](https://selwynorren.github.io/converIT/img/badge.svg)](https://github.com/selwynorren/converIT/releases/download/0.0.1/com.github.selwynorren.converIT_0.0.1_amd64.deb) (This will be live in due course)

#### Hit the link to get Ciano!

<!--- [Get the Flatpak](https://flathub.org/repo/appstream/com.github.robertsanseries.ciano.flatpakref)-->

- [Get the Source Code](https://github.com/selwynorren/converIT/archive/master.zip)

### Installation from the source code

#### Application Dependencies
These dependencies must be present before building
 - `meson (>=0.40)`
 - `valac (>=0.16)`
 - `debhelper (>= 9)`
 - `libgranite-dev`
 - `libgtk-3-dev`
 - `ffmpeg`
 - `imagemMagick`

 #### Building

```
git clone https://github.com/selwynorren/converIT.git && cd ciano
meson build && cd build
meson configure -Dprefix=/usr
ninja
```

#### Installation & executing
```
sudo ninja install
com.github.selwynorren.converIT
```

#### Uninstalling

```
sudo ninja uninstall
```

### Contributing

#### Donations
 - If you like converIT and you want to support it's development, consider donating via [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KFK8QK4E9ZQSL).

#### Development
To help, access the links below:

- [Guide on Code Style](https://github.com/selwynorren/converIT/wiki/Guide-on-code-style)

- [Proposing Design Changes](https://github.com/selwynorren/converIT/wiki/Proposing-Design-Changes)

- [Reporting Bugs](https://github.com/selwynorren/converIT/wiki/Reporting-Bugs)

- [How to Translate converIT](https://github.com/selwynorren/converIT/wiki/Translate)

