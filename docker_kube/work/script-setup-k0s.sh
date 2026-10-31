# k0s Air-gap Install: https://docs.k0sproject.io/head/airgap-install/

setup_k0s() {
  local VER_K0S_REQ="${1:-}" VER_K0S VER_K0S_URL URL_K0S
  VER_K0S="${VER_K0S_REQ#v}"
  if [ -z "${VER_K0S}" ]; then
    VER_K0S=$(curl -sL https://docs.k0sproject.io/stable.txt)
    VER_K0S="${VER_K0S#v}"
  fi
  [ -n "${VER_K0S}" ] || return 1
  VER_K0S="v${VER_K0S}"
  VER_K0S_URL="${VER_K0S//+/%2B}"
  URL_K0S="https://github.com/k0sproject/k0s/releases/download/${VER_K0S_URL}/k0s-${VER_K0S_URL}-${ARCH}" \
  && echo "Downloading k0s version ${VER_K0S} from ${URL_K0S}" \
  && mkdir -pv /opt/k0s && curl -L -o /opt/k0s/k0s ${URL_K0S} \
  && chmod +x /opt/k0s/k0s
  /opt/k0s/k0s version
}

setup_k0s_pack() {
  local VER_K0S_REQ="${1:-}" VER_K0S VER_K0S_URL URL_K0S_IMG
  VER_K0S="${VER_K0S_REQ#v}"
  if [ -z "${VER_K0S}" ]; then
    VER_K0S=$(curl -sL https://docs.k0sproject.io/stable.txt)
    VER_K0S="${VER_K0S#v}"
  fi
  [ -n "${VER_K0S}" ] || return 1
  VER_K0S="v${VER_K0S}"
  VER_K0S_URL="${VER_K0S//+/%2B}"
  URL_K0S_IMG="https://github.com/k0sproject/k0s/releases/download/${VER_K0S_URL}/k0s-airgap-bundle-${VER_K0S_URL}-linux-${ARCH}.tar" \
  && echo "Downloading k0s airgap images version ${VER_K0S} from ${URL_K0S_IMG}" \
  && curl -L -o "/opt/k0s/k0s-airgap-bundle-${VER_K0S}-linux-${ARCH}.tar" "${URL_K0S_IMG}"
}
