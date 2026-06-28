pkgname=kde-plasma6-applets-textlauncher
pkgver=1.0.0
pkgrel=1
pkgdesc="A KDE Plasma widget for launching applications with a text button."
arch=('any')
url='https://github.com/RareHyperIonYT/TextLauncher'
license=('MIT')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/dev.rarehyperion.textlauncher"
    cp -r "$srcdir/TextLauncher-$pkgver/"* \
        "$pkgdir/usr/share/plasma/plasmoids/dev.rarehyperion.textlauncher/"
}
