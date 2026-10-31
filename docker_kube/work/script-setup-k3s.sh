# k3s Air-gap Install: https://docs.k3s.io/installation/airgap?airgap-load-images=Manually+Deploy+Images

setup_k3s() {
  #  Install the latest release: https://github.com/k3d-io/k3s
     VER_K3S=$(curl -sL https://github.com/k3s-io/k3s/releases.atom | grep 'releases/tag/v' | grep -v 'rc' | head -1 | grep -Po '\d[\d.]+' ) \
  && URL_K3S="https://github.com/k3s-io/k3s/releases/download/v$VER_K3S%2Bk3s1/k3s${SUFFIX}" \
  && echo "Downloading k3s version ${VER_K3S} from: ${URL_K3S}" \
  && mkdir -pv /opt/k3s && curl -L -o /opt/k3s/k3s $URL_K3S \
  && chmod +x /opt/k3s/*k3s*
  /opt/k3s/k3s --version
}

setup_k3s_pack() {
  # Download k3s image for offline-mode installation
     VER_K3S=$(curl -sL https://github.com/k3s-io/k3s/releases.atom | grep 'releases/tag/v' | grep -v 'rc' | head -1 | grep -Po '\d[\d.]+' ) \
  && URL_K3S_IMGS="https://github.com/k3s-io/k3s/releases/download/v$VER_K3S%2Bk3s1/k3s-airgap-images-${ARCH}.tar.zst" \
  && curl -L -o /opt/k3s/k3s-airgap-images-${ARCH}.tar.zst $URL_K3S_IMGS
}
